#!/bin/sh
# A script to setup all the dotfiles

# check for realpath(1) which doesn't exist on OpenBSD.
# We need to use realpath(1) on FreeBSD since the home directory is actually
# /usr/home/$USERNAME, which seems to matter very much to stow(1)
which realpath

if [ $? -eq 0 ]; then
  HOMEDIR=`realpath $HOME`
else
  HOMEDIR=`echo $HOME`
fi

if [ -z "$HOMEDIR" ]; then
  echo "Couldn't set HOMEDIR!"
  exit 1
fi

# Create a directory if it doesn't exist
# $1 Name of directory to create
create_dir()
{
  if [ ! -d "$1" ]; then
    echo "Creating $1"
    mkdir "$1"
  fi
}

create_dir "$HOMEDIR/.config"
create_dir "$HOMEDIR/.gnupg"
create_dir "$HOMEDIR/.ssh"
create_dir "$HOMEDIR/.zile-backups"
create_dir "$HOMEDIR/.scripts"
create_dir "$HOMEDIR/source"
create_dir "$HOMEDIR/build"
create_dir "$HOMEDIR/test"

which stow
if [ $? -ne 0 ]; then
  exit 1
fi

SUBDIRS=`ls -d stow*`

echo "Will now run stow on the following directories:"
for DIR in $SUBDIRS; do
  echo "$DIR"
done

for DIR in $SUBDIRS; do
  stow -t "$HOMEDIR" "$DIR"
done

xsess="$HOMEDIR/.xsession"
if [ -h "$xsess" ]; then
  echo "Symbolic link $xsess already exists!"
elif [ -f "$xsess" ]; then
  echo "There is a regular file $xsess"
else
  ln -s "$HOMEDIR/.xinitrc" "$xsess"
fi

heredir=`pwd`
gitign="$HOMEDIR/.gitignore"
if [ -h "$gitign" ]; then
  echo "Symbolic link $gitign already exists!"
elif [ -f "$gitign" ]; then
  echo "There is a regular file $gitign"
else
  ln -s "$heredir/mygitignore" "$HOMEDIR/.gitignore"
fi

