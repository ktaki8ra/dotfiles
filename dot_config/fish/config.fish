set -x PATH /opt/homebrew/bin $PATH
set -x PATH (brew --prefix postgresql@15)/bin $PATH
set -x PATH /opt/homebrew/opt/openjdk@11/bin $PATH
set -x PATH $HOME/.cargo/bin $PATH

set -x LSCOLORS gxfxcxdxbxegedabagacad

# for Java
set -x PATH ~/Library/Java/JavaVirtualMachines/temurin-11.0.22/Contents/Home/bin $PATH
set -x PATH $HOME/jvm/apache-maven-3.9.6/bin $PATH

# Golang
set -x PATH $PATH:$(go env GOPATH)/bin

if status is-interactive
    # Commands to run in interactive sessions can go here
    source (nodenv init -|psub)
    source (rbenv init -|psub)
end

# sdkman
function sdk
    bash -c "source $HOME/.sdkman/bin/sdkman-init.sh && sdk $argv"
end
for ITEM in $HOME/.sdkman/candidates/* ;
    set -gx PATH $PATH $ITEM/current/bin
end
