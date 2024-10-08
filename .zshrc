# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# ENABLE_CORRECTION="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# open projects
alias open-edna2="cd ~/Projects/edna2/edna2-mobile && code . && yarn ios"
alias open-app="cd ~/Projects/expo/budget-keepr && zed . && npm run ios"

# vim open projects
alias vb="cd ~/Projects/expo/budget-keepr && vim"
alias vbw="cd ~/Projects/nextjs/capito-web && vim"
alias tvb="tmux start-server\; new-session -A -s capito -n Code \; send-keys -t capito 'cd ~/Projects/expo/budget-keepr && vim' Enter\;  new-window -t capito:1 -n Session \; send-keys -t capito:1 'cd ~/Projects/expo/budget-keepr && npm run ios -c' Enter\; attach -t capito \;"
alias va="cd ~/Projects/expo/agendax-app && vim"

alias vbsf="cd ~/Projects/expo/budget-keepr/supabase/functions && vim"

alias vg="cd ~/Projects/galorama && vim"
alias tvg="tmux start-server\; new-session -A -s galorama -n Code \; send-keys -t galorama 'cd ~/Projects/galorama && vim' Enter\;  new-window -t galorama:1 -n Session \; send-keys -t galorama:1 'cd ~/Projects/galorama && npm run dev' Enter\; attach -t galorama \;"

alias vc="cd ~/ && vim"
alias vv="cd ~/.config/nvim && vim"
alias vz="vim ~/.zshrc"

alias vui="cd ~/Projects/expo/chad-ui && vim"
alias tvo="tmux new -A -s obsidian \; send-keys -t obsidian.0 'vim ~/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/Vault' ENTER \;"
alias vo="cd ~/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/Vault && vim"

# zed open projects
alias open-ui="cd ~/Projects/expo/chad-ui && zed . && npm run ios"
alias open-galorama="cd ~/Projects/galorama && zed . && npm run supabase:start && npm run dev"

# TMUX
alias t="tmux"
alias tka="tmux kill-session -a"
alias tks="tmux kill-server"
alias tls="tmux ls"
alias ta="tmux attach"
alias tn="tmux new -A -s"
alias tm="tmux start-server\; new-session -A -s main -n Code \; new-window -t main:1 -n Session \; attach -t main \;"
alias tva="tmux start-server\; new-session -A -s agendaX -n Code \; send-keys -t agendaX 'cd ~/Projects/expo/agendax-app && vim' Enter\;  new-window -t agendaX:1 -n Session \; send-keys -t agendaX:1 'cd ~/Projects/expo/agendax-app && npm run ios -c' Enter\; attach -t agendaX \;"

#alias npm="pnpm"
#alias nnpm="npm"
alias vim="nvim"
# alias vim="nvim"
alias nv="neovide"
alias ls="eza --icons=always"
alias cd="z"
# alias dev="tmux new -A -s session \; send-keys -t session.0 'npm run tmux:start' ENTER \;"

alias sz="source ~/.zshrc"
alias v="nvim"
alias lg="lazygit"
alias hg="history | grep"

alias docs-sveltekit="cd ~/Projects/docs/kit/sites/kit.svelte.dev/ && npm run preview"
alias docs-tailwind="cd ~/Projects/docs/tailwindcss.com && npm run start"

eval "$(zoxide init zsh)"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/Users/cf913/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
#
source $HOMEBREW_PREFIX/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=9999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ANDROID STUDIO STUFF
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home
export ANDROID_HOME=/Users/cf913/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# bindkey '\t' autosuggest-accept
