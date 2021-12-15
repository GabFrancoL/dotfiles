#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
alias rmop='sudo pacman -Rs $(pacman -Qtdq)'
alias gdrivesync='sh ~/.local/share/gdrivesync.sh'
alias upmir='sudo reflector --latest 5 --country Brazil --sort rate --save /etc/pacman.d/mirrorlist --verbose'
alias spotify='systemctl --user start spotifyd && spt'
alias warsawstart='sudo systemctl start warsaw'
alias warsawstop='sudo systemctl stop warsaw'
alias uppip='pip freeze --user | cut -d'=' -f1 | xargs -n1 pip install -U'

##-----------------------------------------------------
# Starship
eval "$(starship init bash)"

# Shell color scripts
# colorscript -e panes

# Neofetch
neofetch
