# DishaSetu Supabase wiring update

Your `supabase-config.js` and `supabase-schema.sql` have already been committed/run. This update contains the two app files that were still missing from the GitHub deployment.

## Exactly what to do
1. Extract this ZIP.
2. In GitHub repository `abhirambuthala98/DISHASETU`, replace the existing root `index.html` and `script.js` with the two files from this ZIP.
3. Leave `style.css`, `supabase-config.js`, `supabase-schema.sql`, `.nojekyll`, and `README.md` as they are.
4. Commit both changed files to `main` and wait for GitHub Pages to redeploy.
5. Open the Pages website, hard refresh (Ctrl+Shift+R), then test signup and sign-in.

## What this adds
- Loads Supabase JS v2 from a CDN, then `supabase-config.js`, before `script.js`.
- Initializes Supabase using `window.DISHASETU_SUPABASE_CONFIG`.
- Uses Supabase Auth for email/password signup/sign-in, session restore, sign-out, password reset and Google OAuth (Google requires provider setup in Supabase).
- Syncs the student's profile and workspace app-state to `profiles` and `user_app_state` under the current signed-in user.
- Keeps a local demo fallback if the configuration contains placeholders.

Do not replace `supabase-config.js` with the template from another ZIP. Keep the already-configured file in your repository. Use only the public publishable key in the browser; never expose the service-role/secret key.
