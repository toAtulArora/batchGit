#!/usr/bin/env bash

# SCRIPT_PATH="$PWD/autoGit.sh"
ROOT_DIR="/Users/atulsingharora/Documents/GitHub"
ROOT_BATCHGIT="/Users/atulsingharora/Documents/GitHub/batchGit"

SCRIPT_PATH="$ROOT_BATCHGIT/autoGit.sh"
DIR_LIST="$ROOT_BATCHGIT/dirs.txt"


read -p "Edit active directories? (y/n): " ans

if [[ "$ans" == "y" ]]; then
  vim "$ROOT_BATCHGIT/dirs.txt"
else
  echo "Configurations:"
  echo "Looks for folders in: $ROOT_DIR"
  echo "batchGit sits in: $ROOT_BATCHGIT"
  echo "autoGit is being run from: $SCRIPT_PATH"
  echo "Directories are being taken from: $DIR_LIST"
  echo ""
  echo ""
fi


##!/bin/bash



while IFS= read -r dir; do
  
  # trim leading/trailing whitespace
  dir="$(echo "$dir" | xargs)"

  # skip empty lines or comments
  if [[ -z "$dir" || "$dir" == \#* ]]; then
    echo "Skipping directory (commented out): $dir" >&2
    continue
  fi

  if [[ ! -d "$ROOT_DIR/$dir" ]]; then
    echo "Skipping invalid directory: $ROOT_DIR/$dir" >&2
    continue
  fi

  # [ -z "../$dir" ] && continue   # skip empty lines

  echo "Running autoGit in $dir"
  osascript <<EOF
tell application "Terminal"
    do script "cd \"$ROOT_DIR\" && cd \"$dir\" && \"$SCRIPT_PATH\""
end tell
EOF

done < "$DIR_LIST"



# osascript <<EOF
# tell application "Terminal"
#     do script "vim \"$ROOT_BATCHGIT/dirs.txt\""
# end tell
# EOF

#ln -s /Users/atulsingharora/Documents/GitHub/batchGit /usr/local/bin/batchGit