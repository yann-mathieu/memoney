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
- **The weekly haul** — one chip per week: teal and stamped PAID, or gold and
  dashed for the weeks still owed.
- Payments can be removed from the list if one gets entered by mistake.

## The book lives in this repo

The ledger is `data/ledger.json`, committed alongside the app — plain JSON, no
secrets in it, readable and editable straight on github.com.

The page reads that file every time it opens, so whoever loads it sees the same
book. Writing back happens one of two ways:

1. **With a token** — in *The book in GitHub*, paste a
   [fine-grained personal access token](https://github.com/settings/personal-access-tokens/new)
   scoped to this repository alone with **Contents: read and write**. Then
   recording a payment commits `data/ledger.json` for you. The token is kept in
   that browser's local storage on that device only — it is never written into
   the book, the repo, or anywhere else. Give it to the phone that pays; leave it
   off the kid's device and his copy stays read-only.
2. **Without a token** — *Copy the book* puts the JSON on your clipboard to
   paste into the file on github.com. No token anywhere.

Either way the browser keeps its own copy, so the page still works with no
network and syncs up the next time it can reach GitHub.

### Putting it online

Settings → Pages → deploy from a branch, pick the branch and `/ (root)`. The app
is `index.html` at the root, so `https://<owner>.github.io/memoney/` serves it.
The GitHub panel pre-fills the owner and repo from that URL; set **Branch** to
whichever branch holds `data/ledger.json`.

## The math

`weeks counted` = every allowance day from the start date through today.
`owed` = weeks × weekly amount − everything handed over. A week's chip is stamped
PAID once the running total of payments covers it. Changing the weekly amount
re-values past weeks too, so change it on a week the book is square.

## Files

| File | What it is |
| --- | --- |
| `src/app.html` | The app. Single source of truth — markup, styles, logic. |
| `index.html` | Generated standalone page. Open it in any browser. |
| `data/ledger.json` | The book: settings and every payment. |
| `build.sh` | Wraps `src/app.html` in a document skeleton to produce `index.html`. |

`src/app.html` is a document *fragment* (no `<html>`/`<body>`) because that's
what the Claude Artifact publisher expects — it supplies the skeleton. Run
`./build.sh` after editing so `index.html` stays in step.

Published as a Claude Artifact it uses the artifact's shared database instead of
GitHub, and the GitHub panel hides itself. Same file, either home.

No dependencies, no build tooling beyond that shell script.
