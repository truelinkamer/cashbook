-- Run once in Supabase > SQL Editor. Makes the cash book open (no login, no codes).
drop policy if exists "cash read" on cash_days;
drop policy if exists "cash insert" on cash_days;
drop policy if exists "cash update" on cash_days;
drop policy if exists "cash delete" on cash_days;
drop policy if exists "open all" on cash_days;
grant select, insert, update, delete on cash_days to anon;
create policy "open all" on cash_days for all to anon using (true) with check (true);
