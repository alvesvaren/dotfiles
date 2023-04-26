export PATH=$HOME/.node_modules/bin:$PATH
export npm_config_prefix=~/.node_modules
export PATH=$PATH:$HOME/.yarn/bin:$HOME/.local/bin:$HOME/.gem/ruby/3.0.0/bin:$HOME/.cargo/bin
export ZSH="/usr/share/oh-my-zsh"

export SSH_AUTH_SOCK=${XDG_RUNTIME_DIR}/ssh-agent.socket

ZSH_THEME="clean-lambda"
HYPHEN_INSENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
DISABLE_UPDATE_PROMPT="true"
ENABLE_CORRECTION="true"
VI_MODE_SET_CURSOR=true

plugins=(git zsh-autosuggestions fast-syntax-highlighting vi-mode)

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
source $ZSH/oh-my-zsh.sh

eval "$(pyenv virtualenv-init -)"
unsetopt nomatch

# Personal aliases
alias dotfiles="git --git-dir $HOME/.cfg/.git --work-tree=$HOME"
alias help="bash -c help"
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias vim="echo Use nvim instead && echo $@ > /dev/null"
alias xcopy="xclip -selection c"
alias xpaste="xclip -selection c -o"
alias please="sudo"
alias fucking="sudo"
alias make="/usr/bin/make -j24"
alias pihubreplace="ssh pi@pihub -C '/home/pi/srv/replace.sh && exit'"
alias pihub="ssh pi@pihub"
alias git-complete-reset="~/.scripts/please_die_git.sh"
alias clone-all-forks="~/.scripts/clone_all_forks.py"
alias gitroot="git rev-parse --show-toplevel"
alias mccli-exec="ssh s1 -C 'mccli exec $@'"
alias reverse="python -c \"import sys;print(''.join(sys.stdin.read().strip()[::-1]))\""
alias c="code"
alias cdl="cd \`ls -lt | awk '/^d/ {print \$9}' | head -n1\`"
alias paper='. /home/alve/dev/Paper/paper'
alias cancelshutdown="touch /tmp/cancel-shutdown"
alias hue="~/.scripts/light.sh"

function tiktoktts() {
	echo "creating tts of '$@'"
	curl -s 'https://lazypy.ro/tts/proxy.php' -X POST -H 'Content-Type: application/x-www-form-urlencoded' --data-urlencode 'service=TikTok' --data-urlencode 'voice=en_us_002' --data-urlencode "text=$@" | jq -r '.speak_url' | xargs curl > /tmp/f.mp3
	echo written file to /tmp/f.mp3
	play /tmp/f.mp3
}

function dev() {
  code ~/dev/$1
  exit
}

gitsum() {
	changes=$(git diff --shortstat $1 | cat | cut -f2-3 -d',' | grep -oE '[0-9]+' | paste -sd+ | bc)
	echo $changes insertions and deletions compared to $1
}

unmv() {
	mv $2 $1
}

compdef '_path_files -W ~/dev -/' dev


# kdesrc-build #################################################################

## Add kdesrc-build to PATH
export PATH="$HOME/kde/src/kdesrc-build:$PATH"


## Autocomplete for kdesrc-run
function _comp_kdesrc_run
{
  local cur
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"

  # Complete only the first argument
  if [[ $COMP_CWORD != 1 ]]; then
    return 0
  fi

  # Retrieve build modules through kdesrc-run
  # If the exit status indicates failure, set the wordlist empty to avoid
  # unrelated messages.
  local modules
  if ! modules=$(kdesrc-run --list-installed);
  then
      modules=""
  fi

  # Return completions that match the current word
  COMPREPLY=( $(compgen -W "${modules}" -- "$cur") )

  return 0
}

## Register autocomplete function
complete -o nospace -F _comp_kdesrc_run kdesrc-run

################################################################################


