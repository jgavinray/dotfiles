# Bash Shell Config

# GPG Stuffs
export GPG_TTY=$(tty)

# Alias'
alias vi='vim'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias k='kubectl'
alias mtr='mtr -t'


# Prompt
source "${HOME}"/.kube-ps1.sh

function parse_git_branch {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export PS1='\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[m\]$(kube_ps1) \[\033[33;1m\]\w\[\033[m\] \[\033[32m\]$(parse_git_branch)\[\033[m\]\n$ '

# Kubernetes Stuff
alias k='kubectl'
source "${HOME}"/.ktx
source "${HOME}"/.ktx-completion.sh
alias debugpod='kubectl run -i --tty --rm debug --image=nicolaka/netshoot --restart=Never -- /bin/bash'
alias kgetall='kubectl get $(kubectl api-resources --verbs=list -o name | paste -sd, -) --ignore-not-found --show-kind -o wide $NS'
function set-kubeconfig {
	export KUBECONFIG=~/.kube/${1:-kubeconfig}
}

function decode_kubernetes_secret {
  kubectl get secret $@ -o json | jq '.data | map_values(@base64d)'
}
alias ds="decode_kubernetes_secret"


# Paths
export PATH=$PATH:/usr/local/go/bin
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

