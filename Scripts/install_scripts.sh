#!/usr/bin/env bash

scripts_dir="$HOME/Scripts"

if [[ ! -d $scripts_dir ]]; then
    echo "Creating Scripts directory"
    mkdir $scripts_dir
else
    echo "Scripts directory is present at $HOME"
fi

echo "Installing bash scripts from $(pwd)"
cp -f rest.sh $scripts_dir/rest
chmod u+x $scripts_dir/rest.sh