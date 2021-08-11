# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

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

# set PATH so it includes user's private application if it exists
# this is to allow user installed desktop shortcut to appear
if [ -d "$HOME/.local/share" ] ; then
    PATH="$HOME/.local/share:$PATH"
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

#Bind key for zsh-autosuggestions
bindkey '^ ' autosuggest-accept

#Add path to opencv and Ros
#source /opt/ros/noetic/setup.zsh

# Add path to cargo/Rust environment
source "$HOME/.cargo/env"

# Install Ruby Gems to ~/gems 
export GEM_HOME="$HOME/gems"
export PATH="$PATH:$HOME/gems/bin"
