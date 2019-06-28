# Bash Shell Config

# GPG Stuffs
export GPG_TTY=$(tty)

# Alias'
alias vi='vim'

# Functions
function parse_git_branch {
  ref=$(git-symbolic-ref HEAD 2> /dev/null) || return
  echo "("${ref#refs/heads/}")"
}

# Prompt
export PS1='\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]$(parse_git_branch)\n$ '

# Paths
