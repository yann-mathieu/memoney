# Me Money

A one-page allowance tracker, for the household that keeps forgetting to hand
over the weekly pocket money and then can't remember how many weeks have piled up.

It answers one question at a glance: **how much is owed right now, and for how
many weeks.** Every allowance day since the date you're counting from is added
automatically — you never have to remember to "log" a week. You only record the
money you actually hand over.

## Using it

- **Counting from** — set this to the last date he was genuinely paid up.
  Backdate it and every allowance day since is counted for you.
- **Allowance day** and **amount per week** — the default is $5 every week.
- **Hand over $X** — records a payment covering everything owed. For a partial
  payment ("gave him $10 today"), use *Other amount*.
- **The weekly haul** — one chip per week: teal is paid, gold and dashed is owed.
- Payments can be removed from the list if one gets entered by mistake.

## The math

`weeks counted` = every allowance day from the start date through today.
`owed` = weeks × weekly amount − everything handed over. A week's chip turns
teal once the running total of payments covers it. Changing the weekly amount
re-values past weeks too, so change it on a week the book is square.

## Where the data lives

Always in the browser's local storage on the device you're using. When the page
runs as a published Claude Artifact it also uses the artifact's shared database,
so everyone with the link sees the same book — the footer says which is in
effect.

## Files

| File | What it is |
| --- | --- |
| `src/app.html` | The app. Single source of truth — markup, styles, logic. |
| `index.html` | Generated standalone page. Open it in any browser. |
| `build.sh` | Wraps `src/app.html` in a document skeleton to produce `index.html`. |

`src/app.html` is a document *fragment* (no `<html>`/`<body>`) because that's
what the Artifact publisher expects — it supplies the skeleton. Run `./build.sh`
after editing so `index.html` stays in step.

No dependencies, no build tooling beyond that shell script.
