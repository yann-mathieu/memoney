#!/bin/sh
# Wraps the single source fragment (src/app.html) into a standalone page.
# src/app.html is published as-is as a Claude Artifact, where the platform
# supplies the document skeleton; index.html is the same app for any browser.
set -e
out=index.html
{
  echo '<!doctype html>'
  echo '<html lang="en">'
  echo '<head>'
  echo '<meta charset="utf-8">'
  echo '<meta name="viewport" content="width=device-width, initial-scale=1">'
  echo '<meta name="theme-color" content="#DDF0F2">'
  echo '<style>html{color-scheme:light dark}body{margin:0;font:14px system-ui,sans-serif}img{max-width:100%}[hidden]{display:none!important}</style>'
  echo '</head>'
  echo '<body>'
  cat src/app.html
  echo '</body>'
  echo '</html>'
} > "$out"
echo "built $out ($(wc -c < "$out") bytes)"
