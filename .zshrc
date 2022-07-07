# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt nomatch
unsetopt autocd beep extendedglob notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/gabriel/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Aliases
alias ls='ls --color=auto'
alias upmir='sudo reflector --country Brazil --sort rate --save /etc/pacman.d/mirrorlist --verbose'
alias rmop='sudo pacman -Rs $(pacman -Qtdq)'
alias gdrivesync='sh ~/.local/share/gdrivesync.sh'
alias uppip='sudo pip3 list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip3 install -U'
alias ll='ls -la'
alias spt='sh $HOME/.local/share/spotify.sh'
alias cupdates='sh $HOME/.local/share/cupdates.sh'
alias lvim='/home/gabriel/.local/bin/lvim'

# Macchina
macchina

# Delete key
bindkey "^[[3~" delete-char
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
