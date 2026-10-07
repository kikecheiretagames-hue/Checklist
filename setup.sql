create table public.items (
  id uuid primary key default gen_random_uuid(),
  day smallint not null check (day between 0 and 6),   -- 0 = Seg ... 6 = Dom
  name text not null,
  descr text not null default '',
  has_check boolean not null default true,
  done_week date,                                       -- segunda-feira da semana em que foi marcado
  created_at timestamptz not null default now()
);

alter table public.items enable row level security;

create policy "so utilizadores autenticados"
  on public.items for all to authenticated
  using (true) with check (true);
