#!/bin/sh
# A script to setup all the dotfiles

HOMEDIR=`realpath $HOME`

if [ ! -d "$HOMEDIR/.config" ]; then
  echo "Creating config dir"
  mkdir "$HOMEDIR/.config"
fi

if [ ! -d "$HOMEDIR/.gnupg" ]; then
  echo "Creating $HOMEDIR/.gnupg"
  mkdir "$HOMEDIR/.gnupg"
fi

if [ ! -d "$HOMEDIR/.ssh" ]; then
  echo "Creating $HOMEDIR/.ssh"
  mkdir "$HOMEDIR/.ssh/"
fi

ZILE_BU_DIR="$HOMEDIR/.zile-backups"
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
  stow -t "$HOMEDIR" "$DIR"
done
