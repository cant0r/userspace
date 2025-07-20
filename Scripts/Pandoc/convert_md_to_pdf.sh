#!/bin/bash

# [Description]
# This script converts a Markdown file to PDF using Pandoc via invoking the pandoc/latex docker image.

# [Usage]
# ./convert_md_to_pdf.sh <input>

if [[ ! -e "$1" ]]; then
  echo "Input file $1 does not exist."
  exit 1
fi

echo "Creating temporary directory for conversion..."
TEMP_DIR=$(mktemp -d)

if [[ ! -d "$TEMP_DIR" ]]; then
  echo "Failed to create temporary directory."
  exit 1
fi

echo "Copy input file to temporary directory..."
cp "$1" "$TEMP_DIR/"

# TODO: Font support with custom pandoc image
docker run --rm \
       --volume "$TEMP_DIR:/data" \
       --user "$(id -u)":"$(id -g)" \
       pandoc/latex:edge "$1" -o "${1%.md}.pdf" --pdf-engine=lualatex -f markdown -t pdf

echo "Getting output file..."

if [[ ! -e "$TEMP_DIR/${1%.md}.pdf" ]]; then
  echo "Output file ${1%.md}.pdf was not created."
  exit 1
fi

mv -f "$TEMP_DIR/${1%.md}.pdf" .

echo "Cleaning up temporary $TEMP_DIR directory..."
rm -rf "$TEMP_DIR"
