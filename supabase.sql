-- Run in Supabase SQL Editor. Enable Realtime for auction_rooms and auction_events.
create table if not exists public.auction_rooms (
  code text primary key, state jsonb not null, updated_at timestamptz default now()
);
create table if not exists public.auction_events (
  id bigint generated always as identity primary key, room_code text references public.auction_rooms(code) on delete cascade,
  event jsonb not null, created_at timestamptz default now()
);
alter table public.auction_rooms enable row level security;
alter table public.auction_events enable row level security;
-- Demo policy: anyone with the room code can read/write. For a public production app,
-- replace these policies with authenticated membership checks and server-side validation.
create policy "room read" on public.auction_rooms for select using (true);
create policy "room insert" on public.auction_rooms for insert with check (true);
create policy "room update" on public.auction_rooms for update using (true) with check (true);
create policy "events read" on public.auction_events for select using (true);
create policy "events insert" on public.auction_events for insert with check (true);
alter publication supabase_realtime add table public.auction_rooms;
alter publication supabase_realtime add table public.auction_events;