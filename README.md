https://abhirambuthala98.github.io/DISHASETU/
# DishaSetu — Branch-Aware Career & Skills Roadmaps

DishaSetu is a responsive, static learning-planning prototype built with HTML, CSS and vanilla JavaScript. It can be hosted on GitHub Pages without a build step.

## What's included in this build

- **Branch selection during onboarding and profile editing** for CSE, CSE (AI/ML), IT, AI & Data Science, ECE, EEE, Mechanical, Civil, Chemical, Biotechnology, Biomedical, Aerospace, Automobile, Agricultural, Mining, Industrial/Production, Environmental and Other/Custom.
- **Branch-aware Skills Portal and Roadmap Explorer.** The default view recommends domain-relevant skills and roles. Students can switch to all skills/roles at any time; branch selection guides recommendations but does not restrict careers.
- **Expanded catalogue:** 48 career roles and 64 skills/practice paths, including dedicated paths for embedded systems, electronics fundamentals, VLSI, power systems, mechanical CAD/CAE, thermodynamics, robotics, manufacturing quality, civil CAD/BIM, structural engineering, chemical process engineering, biotechnology, biomedical instrumentation, aerospace, automotive/EVs, agricultural engineering, mining, environmental engineering and operations research.
- **Detailed five-phase learning roadmaps** with vertically scrollable curriculum details, connected curved milestone overview on larger screens, phase navigation and a responsive vertical timeline on smaller screens. New engineering curricula have five curated phases, with topics, prerequisites, effort estimates, practice, projects, completion criteria and learning resources.
- **Per-topic states:** Pending, In Progress, Done and Skipped. Done counts toward completed progress; skipped items remain visibly distinct and do not count as completed. Status changes can be reversed and are saved locally per roadmap.
- **Topic-specific resources:** relevant Apna College YouTube searches, GeeksforGeeks article searches and W3Schools tutorials where applicable. Engineering-domain paths point to engineering video searches and NPTEL's course catalogue, with GeeksforGeeks where relevant. Search links are labeled honestly; the app does not fabricate individual video IDs.
- **Branch-aware career plan:** year-wise foundations, domain skills, labs/practical work, specialization, project evidence, internships and career-readiness planning adapt to the selected branch. A student's target career can still be outside their branch.
- **Other workspace tools:** personalized dashboard, projects, internship-source and application tracking, resume studio, job-description keyword analysis, activity view, guided mentor, resource library, settings and local data backup.
- **Premium visual design:** charcoal, warm ivory and gold styling, interactive states, responsive layouts and reduced-motion support.

## Run locally

1. Extract the ZIP.
2. Open the folder in VS Code.
3. Start Live Server from `index.html`, or open the HTML file in a browser.
4. Create a demo account and complete onboarding. Choose an engineering branch and target career.
5. Open **Skills Portal** or **Roadmap Explorer**. Use the branch selector to change recommendations; choose **All skills** or **All roadmaps** to explore beyond your branch.
6. Open a roadmap, select a phase, expand topic groups and test Start / Done / Skip. Refresh and use browser Back/Forward to check route and progress persistence.

No npm packages or build command are needed. Google Fonts are loaded from Google Fonts when internet access is available; system fallbacks are included.

## Resource-link behavior

Apna College links open a YouTube search scoped to the current skill and topic. GeeksforGeeks links search its articles. W3Schools links are included only where a tutorial is applicable. Engineering-domain resources include topic-specific engineering lecture searches and the NPTEL course catalogue. Where a specific video or article has not been verified, the app labels the destination as a search rather than implying it is a verified individual resource. Review links when aligning the learning plan to a course syllabus.

## Deploy to GitHub Pages

1. Create a GitHub repository.
2. Upload `index.html`, `style.css`, `script.js`, `README.md`, and `.nojekyll` to the repository root.
3. Open **Settings → Pages**.
4. Select **Deploy from a branch**, choose `main` and `/(root)`, then save.
5. Wait for the Pages workflow and open the published URL.

## Important production limitations

This is a deployable **static prototype**, not a production-authenticated SaaS app. Sign-in and profile/progress data use local browser storage; they do not provide secure identity verification, cross-device synchronization or multi-user isolation. The mentor uses guided/rule-based responses and is not connected to a live AI model. Internship shortcuts open external sources; the prototype does not provide a verified live vacancy feed. Before production, connect secure authentication and a backend/database (for example Supabase or Firebase), enforce server-side authorization, protect API keys, and integrate lawful live opportunity sources.

Branch roadmaps are structured study plans, not official university syllabi, licensure requirements or placement guarantees. Specific subjects, lab hours, certifications and industry requirements vary by university, country and specialization. Map each roadmap to the student's actual curriculum and verify important details against primary course documentation and current role requirements.

## Scrollability fix

The updated build corrects the clipped navigation and roadmap-detail areas shown in the user report:

- The desktop sidebar has its own vertical scrollbar, so lower navigation items, career goal, and profile controls remain reachable on short screens.
- The milestone navigator and phase detail panel use independent, viewport-sized scroll regions on desktop.
- The phase detail panel owns the vertical scroll to avoid a nested-scroll conflict inside the topic list. Topic actions preserve the panel's scroll position after re-rendering.
- Search and status filters remain accessible in the phase panel while navigating longer lists.
- On tablet/mobile layouts, fixed-height panels are removed and the document uses natural vertical scrolling.
- Scroll regions have accessible labels/focus targets and visible scrollbar styling.

Validation performed for this fix: JavaScript syntax check; Chromium interaction smoke test confirming wheel scrolling changes the roadmap panel's `scrollTop` without moving the document; sidebar wheel scrolling reaches its bottom; topic Done action preserves the detail panel's scroll position; mobile layout reverts to document scrolling. These checks are focused on scroll and interaction behavior, not a full production QA audit.

## Glassmorphism visual overhaul

This version adds a cohesive advanced-CSS visual layer while preserving the DishaSetu brand palette:

- **Palette retained:** charcoal/black (`#171717`, `#111111`), dark surfaces (`#222222`–`#292929`), gold (`#F5B800`), ivory (`#F8F7F2`), muted gray (`#A3A3A3`) and subtle borders (`#383838`).
- **Glass surfaces:** translucent charcoal fills, restrained `backdrop-filter` blur, fine low-contrast borders, inset highlights and layered shadows on key panels.
- **Premium navigation:** glass sidebar/top bar, more refined active navigation, polished icon buttons and search fields.
- **Interactive states:** subtle gold edge lighting, focused inputs, refined hover states, button feedback and clearer status-card separation.
- **Roadmap clarity:** topic cards remain high-contrast; Done, In Progress and Skipped retain visibly distinct styling. Heavy blur is intentionally avoided on repeated list rows so long curricula scroll smoothly.
- **Responsive/accessibility safeguards:** effects are softened on small screens; `prefers-reduced-motion` is honored; browser fallback styles remain available where `backdrop-filter` is unsupported.
- **Scroll behavior preserved:** this is a CSS-only overlay on the existing layout and does not change the dimensions/overflow rules for the sidebar, milestone navigator, roadmap detail panel, or mobile document scroll.

The app's authentication/data and live-service limitations described above still apply.


## Glass Theme V2

This build makes the glassmorphism intentionally more visible across the whole product: the sidebar and top bar use higher-transparency frosted glass; main surfaces, roadmap panes, phase cards, topic groups, resource cards, form controls and secondary buttons have translucent layers, brighter edge highlights and deeper backdrop blur. Ambient gold and ivory light gradients appear behind the glass to create visible depth while keeping the established charcoal / gold / ivory palette. The visual layer does not change application logic, topic status behavior, route handling, or the desktop/mobile scroll containers. Blur levels are reduced on smaller screens, and browsers without `backdrop-filter` receive a darker readable fallback.

This package is the **Full Glass Theme** version. Compared with the earlier subtle glass pass, more panels use lower-opacity fills, more visible backdrop blur/saturation, higher-contrast glass edge highlights and stronger ambient gold/ivory light behind the interface. The existing DishaSetu palette remains unchanged. Validation includes JavaScript syntax, all 13 main route smoke tests, roadmap topic status preserving scroll position, scroll-to-bottom checks for sidebar and roadmap details, mobile natural scrolling, and ZIP integrity.


## Blue Glass Theme (reference palette)

The visual theme is recolored to match the supplied reference swatches: black `#000000`, icy cyan `#B5E2EE`, royal blue `#1B68CF`, light blue `#66A1E0`, deep navy `#1C4B8B`, and cool white `#F4F5F6`. The previous gold/amber accents have been replaced throughout the CSS and SVG roadmap graphics. Glassmorphism remains: translucent frosted surfaces, visible cool-blue borders, backdrop blur, ambient blue/cyan glows, gradient primary buttons and high-contrast topic statuses.
