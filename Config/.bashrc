############
# Aliases
############

# Boot into UEFI
alias into-uefi='sudo systemctl reboot --firmware-setup'

# No rest for the wicked
alias rest='shutdown --no-wall 20:00'

# Interloper time
alias nap='shutdown --no-wall 14:00'

# Keyring refresh stuff
alias upkeys='sudo pacman -Sy --needed archlinux-keyring && sudo pacman -Su'

# Proprietary VNC viewer for proprietary VNC server :/
alias vnc='/home/cant0r/Development/vnc-viewer-7.15.1'

############
