# Start SSH
alias sssh='eval "$(ssh-agent -s)" ; ssh-add ~/.ssh/git_ed25519'

# Fetch updates without merging
alias gf='git fetch'

# Show status
alias gs='git status -sb'

# Display commit history
alias gl='git log --oneline'

# Stage changes
alias ga='git add'
alias gaa='git add .'

# Commit staged changes
alias gc='git commit -m'

# Commit all changes (staged and unstaged)
alias gca='git commit -a -m'

# Show differences (staged then unstaged)
alias gd='git diff --cached --color-words ; echo ; git diff --color-words'
alias gds='git diff --cached --stat ; echo ; git diff --stat' # Show only stats
