#!/bin/bash
backup_dir=$HOME/.backup_dotfiles

for file in .*; do
  if [[ $file == "." || $file == ".." || $file == ".git" ]]; then
    continue
  fi

#Check if the dot file existed and make back_up with prompt to users
  if [[ -f "$HOME/$file" ]]
    then
    echo "$HOME/$file existed"
    #Backup or not?
    read -p "Backup $HOME/$file?(Y/n)" answer
    #Yes, please back up
    if [[ $answer =~ ^[Yy]$ ]]
      then
      [[ -f $HOME/.backup_dotfiles/ ]] || mkdir $backup_dir
      mv $HOME/$file $backup_dir
      [[ $? ]] && echo "moved $file to $backup_dir"
    fi
  fi
  # create the new link
  ln -s ~/dotfiles/$file ~/$file && echo "created symlink to $file"
done
