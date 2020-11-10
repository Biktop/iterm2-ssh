function tabc() {
  NAME=$1; if [ -z "$NAME" ]; then NAME="Default"; fi 
  echo -e "\033]50;SetProfile=$NAME\a"
}

function colorssh() {
  if [[ -n "$ITERM_SESSION_ID" ]]; then
    trap "tabc" INT EXIT

    if [[ "$*" =~ "prod*" ]]; then
      tabc Production
    fi
  fi
  command ssh $*
}

[[ ${TERM} != dumb ]] && () {
  alias ssh="colorssh"
}