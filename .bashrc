#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# --- General Aliases ---
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# --- NVM Setup ---
source /usr/share/nvm/init-nvm.sh

# --- The Vault Sync System ---

# Internal helper to handle the folder jump and the pull
_vault_sync() {
  cd ~/Documents/mycode && git pull
}

# Use this for VS Code
alias vaultvs='_vault_sync && code vault.code-workspace'

# Use this for Antigravity
alias vaultag='_vault_sync && antigravity vault.code-workspace'

# Default 'vault' command (defaults to VS Code)
alias vault='vaultvs'

# --- Git Prompt Dashboard ---
if [ -f /usr/share/bash-git-prompt/gitprompt.sh ]; then
  GIT_PROMPT_ONLY_IN_REPOSITORY=1
  # This theme shows the checkmark/arrows for your vault
  GIT_PROMPT_THEME=Default
  source /usr/share/bash-git-prompt/gitprompt.sh
else
  # Fallback prompt if git-prompt isn't active
  PS1='[\u@\h \W]\$ '
fi

export TERMINAL=ghostty
PS1='\[\e[1;37m\][\[\e[1;33m\]\u\[\e[1;37m\]@\[\e[1;36m\]\h \[\e[1;35m\]\w\[\e[1;37m\]]\$ \[\e[0m\]'
eval "$(starship init bash)"
alias hack='sudo virsh start kalilinux 2>/dev/null; echo "Waking up Kali..."; until ping -c1 192.168.122.100 >/dev/null 2>&1; do echo "Still booting..."; sleep 2; done; echo "Kali is awake! Connecting..."; TERM=xterm-256color ssh kali'
