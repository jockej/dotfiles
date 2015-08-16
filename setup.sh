#!/bin/sh
# A script to setup all the dotfiles

if [ ! -d "~/.config" ]; then
  echo "Creating config dir"
  mkdir "~/.config"
fi

if [ ! -d "~/.gnupg" ]; then
  echo "Creating ~/.gnupg"
  mkdir "~/.gnupg"
fi

if [ ! -d "~/.ssh" ]; then
  echo "Creating ~/.ssh"
  mkdir "~/.ssh/"
fi

ZILE_BU_DIR="~/.zile-backups"
if [ ! -d "$ZILE_BU_DIR" ]; then
  printf "Couldn't find zile backup dir, creating it: %s\n"\
         "$ZILE_BU_DIR"
  mkdir "$ZILE_BU_DIR"
fi

SUBDIRS=`ls -d stow*`

echo "Will now run stow on the following directories:"
for DIR in $SUBDIRS; do
  echo "$DIR"
done

for DIR in $SUBDIRS; do
  stow -t "$HOME" "$DIR"
done
