# tabc <profile name> do the profile change
function tabc() {
  NAME=$1; if [ -z "$NAME" ]; then NAME="Default"; fi 
  echo -e "\033]50;SetProfile=$NAME\a"
}

function colorssh() {
  if [[ -n "$ITERM_SESSION_ID" ]]; then
    trap "tabc" INT EXIT
    tabc Production
  fi
  command ssh $*
}
compdef _ssh tabc=ssh

alias ssh="colorssh"