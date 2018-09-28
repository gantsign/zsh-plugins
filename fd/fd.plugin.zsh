# remove conflicting Oh My Zsh common-aliases for find
unalias fd || true
unalias ff || true

# add aliases for fd
alias fdd='fd --type=directory'
alias fdf='fd --type=file'
