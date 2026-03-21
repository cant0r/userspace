############
# Aliases
############

# Boot into UEFI
alias into-uefi='sudo systemctl reboot --firmware-setup'

# No rest for the wicked
alias rest='shutdown 20:00'

# Interloper time
alias nap='shutdown 14:00'

# Keyring refresh stuff
alias upkeys='sudo pacman -Sy --needed archlinux-keyring && sudo pacman -Su'

############