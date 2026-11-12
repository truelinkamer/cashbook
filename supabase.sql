-- Run this once in Supabase > SQL Editor
create table profiles(user_id uuid primary key references auth.users on delete cascade, role text not null check (role in ('admin','asna','thasleena')));
create table cash_days(id text primary key, cashier text not null check (cashier in ('asna','thasleena')), day date not null, payload jsonb not null, updated_at timestamptz default now());
alter table profiles enable row level security;
alter table cash_days enable row level security;
create function my_role() returns text language sql security definer stable set search_path=public as $$ select role from profiles where user_id=auth.uid() $$;
create policy "read own profile" on profiles for select using (user_id=auth.uid());
create policy "cash read"   on cash_days for select using (my_role()='admin' or cashier=my_role());
create policy "cash insert" on cash_days for insert with check (my_role()='admin' or cashier=my_role());
create policy "cash update" on cash_days for update using (my_role()='admin' or cashier=my_role()) with check (my_role()='admin' or cashier=my_role());
create policy "cash delete" on cash_days for delete using (my_role()='admin' or cashier=my_role());

-- AFTER creating the 3 users in Authentication > Users, run these (change the emails):
-- insert into profiles select id,'admin'     from auth.users where email='admin@yourmail.com';
-- insert into profiles select id,'asna'      from auth.users where email='asna@yourmail.com';
-- insert into profiles select id,'thasleena' from auth.users where email='thasleena@yourmail.com';
