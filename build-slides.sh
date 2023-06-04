#!/usr/bin/env bash

docker run --rm -u $(id -u):$(id -g) -v $(pwd):/documents asciidoctor/docker-asciidoctor \
  asciidoctor-revealjs -a data-uri -a revealjs_theme=white \
  -a revealjsdir=https://cdnjs.cloudflare.com/ajax/libs/reveal.js/3.9.2 -a revealjs_transition=fade \
  -a revealjs_slideNumber=true \
  -a customcss=custom.css \
  -D public -o index.html \
  presentation.adoc

CONFERENCE_NAME="bordeaux-jug"
CONFERENCE_PNG_BASE64=$(cat images/logo-${CONFERENCE_NAME}.png | base64 -w0) QRCODE_PNG_BASE64=$(cat images/qrcode.png | base64 -w0) \
  envsubst < custom.css > public/custom.css 

touch public/.nojekyll