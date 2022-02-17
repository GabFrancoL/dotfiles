#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias upmir='sudo reflector --country Brazil --sort rate --save /etc/pacman.d/mirrorlist --verbose'
alias rmop='sudo pacman -Rs $(pacman -Qtdq)'
alias gdrivesync='sh ~/.local/share/gdrivesync.sh'
alias uppip='sudo pip3 list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip3 install -U'
alias ll='ls -l'
alias steam='steam & disown'
PS1='[\u@\h \W]\$ '

#-----------

# Pfetch
pfetch

# Starship
eval "$(starship init bash)"

# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION
