#!/bin/bash

git log -n1 | grep -q "\\[build_pdf\\]"

if [[ $? -eq 0 ]]; then
  echo "building PDF"
  sudo apt-get install texlive-latex-extra texlive-fonts-recommended
  make all-pdf
fi

git log -n1 | grep -q "\\[build_translations\\]"

if [[ $? -eq 0 ]]; then
  echo "building all languages"
  make html
else
  echo "building english only"
  make html BUILD_LANGUAGES=
fi
