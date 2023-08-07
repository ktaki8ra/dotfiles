set -x PATH /opt/homebrew/bin $PATH
set -x PATH /opt/homebrew/Cellar/postgresql@15/15.3_2/bin $PATH
set -x PATH /opt/homebrew/opt/openjdk@11/bin $PATH
set -x PATH $HOME/.cargo/bin $PATH

set -x LSCOLORS gxfxcxdxbxegedabagacad

if status is-interactive
    # Commands to run in interactive sessions can go here
    source (nodenv init -|psub)
    source (rbenv init -|psub)
end
