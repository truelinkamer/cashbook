# True Link Cash Book

Files: index.html (the app), config.js (your Supabase keys), netlify.toml (makes /asna /thasleena /admin work), logo files, supabase.sql.

## 1. Supabase (free) - database and logins
1. supabase.com > New project.
2. SQL Editor > paste supabase.sql > Run.
3. Authentication > Users > Add user: create 3 users (admin, Asna, Thasleena) with email + password, tick "Auto confirm".
4. Authentication > Sign In / Providers (or Settings): turn OFF "Allow new users to sign up".
5. SQL Editor: run the 3 `insert into profiles ...` lines at the bottom of supabase.sql with the real emails.
6. Project Settings > API: copy Project URL and the anon public key into config.js. Never use the service_role key.

## 2. GitHub
New repository > upload all files in this folder (keep them at the top level) > commit.

## 3. Netlify
Add new site > Import from GitHub > pick the repo > Deploy (no build command; publish directory is the repo root).
Use a NEW site, not truelink-review.

Links: yoursite.netlify.app/asna , /thasleena , /admin
