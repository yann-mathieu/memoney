# Pictures for the porthole

Anything listed here shows up in the porthole on **every** device that opens the
app, instead of the six drawn sea creatures.

1. Put image files in this folder (`.png`, `.jpg`, `.gif`, `.webp`). Square-ish
   crops look best — the porthole is a circle. Keep them small, a couple of
   hundred pixels is plenty.
2. List them in `index.json`:

```json
[
  { "file": "krusty.png", "name": "The boss" },
  { "file": "starfish.jpg", "name": "Next door" }
]
```

`file` is the filename in this folder; `name` is the caption under the porthole.

The app rotates through them at random on each load and picks a line to match how
far behind the allowance is.

**Before you commit pictures here, check what they are.** This repository is
public: anything in it is published to anyone who finds it, and the app serves it
on GitHub Pages. Cartoon and film characters, stock photos and other people's art
are usually somebody's copyright, and a public repo is not the place for them.
Family photos, your kid's own drawings, or images you made or licensed are fine.

If you just want pictures on **your own phone** and not in the repo, skip this
folder entirely — use *The crew* panel in the app. Those stay in that browser and
never leave the device.
