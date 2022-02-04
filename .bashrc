#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias upmir='sudo reflector --latest 5 --country Brazil --sort rate --save /etc/pacman.d/mirrorlist --verbose'
alias rmop='sudo pacman -Rs $(pacman -Qtdq)'
alias gdrivesync='sh ~/.local/share/gdrivesync.sh'
PS1='[\u@\h \W]\$ '

#----------------
# Neofetch
neofetch

# Starship
eval "$(starship init bash)"

