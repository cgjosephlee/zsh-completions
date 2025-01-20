#!/usr/bin/env zsh

update_comp() {
    local cmd=$1
    local prog=${cmd%% *}
    (( $+commands[$prog] )) && { eval "${cmd} > src/_${prog}"; return; } || { echo "${prog} is not installed"; return 1; }
}

# pipx install poetry
update_comp "poetry completions zsh"

# curl -LsSf https://astral.sh/uv/install.sh | sh
update_comp "uv generate-shell-completion zsh"
update_comp "uvx --generate-shell-completion zsh"

# curl -fsSL https://pixi.sh/install.sh | bash
update_comp "pixi completion --shell zsh"

# curl -fsSL https://fnm.vercel.app/install | bash
update_comp "fnm completions --shell zsh"