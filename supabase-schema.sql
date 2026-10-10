-- DishaSetu minimal Supabase schema for authentication + cloud-synced app state.
-- Run the full file once in Supabase Dashboard -> SQL Editor -> New query.
-- All user-owned rows are restricted to the signed-in user via RLS.

create table if not exists public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  email text,
  full_name text not null default '',
  college text not null default '',
  branch text not null default '',
  year smallint not null default 1 check (year between 1 and 4),
  graduation_year smallint,
  career text not null default '',
  skills text not null default '',
  updated_at timestamptz not null default now()
);

create table if not exists public.user_app_state (
  user_id uuid primary key references auth.users(id) on delete cascade,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.profiles enable row level security;
alter table public.user_app_state enable row level security;

drop policy if exists "Users can read own profile" on public.profiles;
create policy "Users can read own profile" on public.profiles
  for select to authenticated using (id = (select auth.uid()));

drop policy if exists "Users can insert own profile" on public.profiles;
create policy "Users can insert own profile" on public.profiles
  for insert to authenticated with check (id = (select auth.uid()));

drop policy if exists "Users can update own profile" on public.profiles;
create policy "Users can update own profile" on public.profiles
  for update to authenticated using (id = (select auth.uid())) with check (id = (select auth.uid()));

drop policy if exists "Users can delete own profile" on public.profiles;
create policy "Users can delete own profile" on public.profiles
  for delete to authenticated using (id = (select auth.uid()));

drop policy if exists "Users can read own app state" on public.user_app_state;
create policy "Users can read own app state" on public.user_app_state
  for select to authenticated using (user_id = (select auth.uid()));

drop policy if exists "Users can insert own app state" on public.user_app_state;
create policy "Users can insert own app state" on public.user_app_state
  for insert to authenticated with check (user_id = (select auth.uid()));

drop policy if exists "Users can update own app state" on public.user_app_state;
create policy "Users can update own app state" on public.user_app_state
  for update to authenticated using (user_id = (select auth.uid())) with check (user_id = (select auth.uid()));

-- Create a private profile row for new users. The user can complete it in onboarding.
create or replace function public.handle_new_dishasetu_user()
returns trigger
language plpgsql
security definer
set search_path = ''
as $$
begin
  insert into public.profiles (id, email, full_name)
  values (
    new.id,
    new.email,
    coalesce(new.raw_user_meta_data ->> 'full_name', new.raw_user_meta_data ->> 'name', '')
  )
  on conflict (id) do update set email = excluded.email;
  return new;
end;
$$;

drop trigger if exists on_auth_user_created_dishasetu on auth.users;
create trigger on_auth_user_created_dishasetu
after insert on auth.users
for each row execute procedure public.handle_new_dishasetu_user();

-- Explicit grants; RLS remains the row-level security boundary.
revoke all on table public.profiles from anon;
revoke all on table public.user_app_state from anon;
grant select, insert, update, delete on table public.profiles to authenticated;
grant select, insert, update on table public.user_app_state to authenticated;
