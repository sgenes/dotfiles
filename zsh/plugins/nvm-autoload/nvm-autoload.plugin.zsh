load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm use default --silent
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use $(cat "${nvmrc_path}") --silent
    fi
  fi
}

add-zsh-hook chpwd load-nvmrc
load-nvmrc
