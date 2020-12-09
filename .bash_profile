# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# if running zsh
if [ -n "$ZSH_VERSION" ]; then
    # include .zshrc if it exists
    if [ -f "$HOME/.zshrc" ]; then
        . "$HOME/.zshrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# set path to Go binary if it exist
if [ -d "/usr/local/go/bin" ] ; then
    #GOROOT is where the go language and other packages are installed
    export GOROOT=/usr/local/go
    #GOPATH is the directory of projects that we are doing, located in home
    export GOPATH=$HOME/go
    #Set the path to the binaries in both the go root and project path (executables that we compiled
    export PATH=$GOROOT/bin:$PATH
    export PATH=$GOPATH/bin:$PATH
fi

#Set capslock to be esc if short tap
xcape -e 'Control_L=Escape'

#Add path to opencv and Ros
source /opt/ros/noetic/setup.bash
source ~/catkin_ws/devel/setup.bash
#export PATH=$PATH:~/libs/opencv3/release/installed
source "$HOME/.cargo/env"
