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

# Pfetch
pfetch

# Starship
eval "$(starship init zsh)"

# Delete key
bindkey "^[[3~" delete-char
