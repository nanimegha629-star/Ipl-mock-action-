# IPL Auction Simulator 2027

A mobile-first React/Vite auction simulator. Deploys to Vercel free tier.

## Important player-data note
The included starter pool contains real cricketers, but it is **not an official IPL 2027 auction, retention, release, or availability list**. Player registrations, retentions, trades and auction eligibility can change. Before a serious 2027 simulation, edit the pool in `src/data.js` using verified official announcements. The app intentionally does not invent official 2027 squads or player prices.

## Run locally
1. Install Node.js 20+.
2. In this folder run `npm install`.
3. Run `npm run dev` and open the local URL.

## Deploy to Vercel from Android
1. Create a GitHub repository and upload the unzipped project files.
2. In Vercel choose **Add New → Project**, import that repository.
3. Framework: Vite. Build command `npm run build`; output directory `dist`.
4. Deploy. No paid plan or API key is needed for solo mode.

## Modes
- **Solo:** works immediately in the browser. You control one franchise and the built-in rival AI bids for the other nine.
- **Friends / multiplayer:** create a free Supabase project. Run `src/supabase.sql` in its SQL Editor. Copy Project URL and anon public key into Vercel Environment Variables as `VITE_SUPABASE_URL` and `VITE_SUPABASE_ANON_KEY`, then redeploy. Create a room and share its 6-character code.
- The included Supabase policies are intentionally simple demo policies, not hardened production security. Anyone who knows a room code can read/write it. Do not use private data or real-money bidding.

## Auction rules implemented
- Starting purse configurable (default ₹120 crore).
- Player base prices in crore, bid increments scale with current price.
- Maximum 25-player squad, maximum 8 overseas players.
- Sold/unsold tracking, purse deduction, current squad, auction results.
- Demo AI rivals; auction outcomes are simulated, not predictions.

## Customize
Edit `src/data.js` to add/remove players, update base prices and nationality. Team purse can be changed in the settings panel in the app.


## IPL 2027 data snapshot (18 November 2026)
- 184 officially retained players across 10 franchises, with official remaining purses and overseas counts.
- 89 officially released players are included separately; MS Dhoni and Ajinkya Rahane are marked retired.
- 14 player trade movements are recorded and traded players are assigned to their new franchise squads.
- The official 2027 auction-registered/shortlisted player list was not published as of 18 November 2026. Released players therefore start as `awaiting_registration`, not auction-eligible. Use “Mark registered” only after checking the official shortlist.
- Released players' previous contract salaries are not treated as auction base prices. The provisional ₹0.30 Cr value is editable and must be replaced with the official registered base price when announced.
- Team purse values are official remaining auction purses after retention. Retained squad members are preloaded without deducting their historical salary a second time.
