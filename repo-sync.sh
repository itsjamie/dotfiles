#!/bin/bash
cd "$(dirname "$0")"
git pull
function doIt() {
  rsync -avz --update --existing ~/ .
}
if [ "$1" == "--force" -o "$1" == "-f" ]; then
  doIt
else
  read -p "This will bring changes from your home directory into the Git repository. Are you sure? (y/n) " -n 1
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    doIt
  fi
fi
unset doIt
