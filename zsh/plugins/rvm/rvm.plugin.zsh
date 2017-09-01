# lazy load rvm
# (c) 2017 Tamado Ramot Sitohang <ramottamado@gmail.com>

load_rvm() {
  # If these already exist, then rvm won't override them.
  unset -f "${rvm_funcs[@]}"

  # Attempt to load rvm from its many possible sources...
  _try_source() { [[ -f $1 ]] || return; source "$1"; return 0; }
  _try_source $RVM_DIR/scripts/rvm || echo "RVM is not installed"
  return_status=$?
  unset -f _try_source

  # Chain-load the appropriate function
  "$@"
}

if [[ $(type -w rvm) != "rvm: function" ]]; then
  rvm_funcs=( rvm ruby irb gem erb rdoc rake ri rvm-prompt )

  for v in "${rvm_funcs[@]}"; do
    eval "$v() { load_rvm $v \"\$@\"; }"
  done
fi

alias rubies='rvm list rubies'
alias gemsets='rvm gemset list'

# TODO: Make this usable w/o rvm.
function gems {
  if [[ $(type -w ruby) == "ruby: function" ]]; then
    load_rvm
  fi
  local current_ruby=`rvm-prompt i v p`
  local current_gemset=`rvm-prompt g`

  gem list $@ | sed -E \
    -e "s/\([0-9, \.]+( .+)?\)/$fg[cyan]&$reset_color/g" \
    -e "s|$(echo $rvm_path)|$fg[magenta]\$rvm_path$reset_color|g" \
    -e "s/$current_ruby@global/$fg[yellow]&$reset_color/g" \
    -e "s/$current_ruby$current_gemset$/$fg[green]&$reset_color/g"
}
