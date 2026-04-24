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


# ~/.zshrc

#spotatui() {
    # 1. Tell Hyprland to make the CURRENT terminal float
#    hyprctl dispatch setfloating active
    
    # 2. Resize it to your perfect dimensions (954x573)
#    hyprctl dispatch resizewindowpixel exact 954 573,active
    
    # 3. Center it on the screen
#    hyprctl dispatch centerwindow active
    
    # 4. Run the actual program 
    # (We use 'command' so zsh doesn't accidentally call this function again)
#    command spotatui "$@"
    
    # 5. Optional: When you quit spotatui, make the window tile again
    # hyprctl dispatch setfloating active
#}

alias spt-centered='ghostty --window-padding-x=400 --window-padding-y=200 --window-padding-balance=true -e spotatui'
# Use this for VS Code
alias vaultvs='_vault_sync && code vault.code-workspace'

# Use this for Antigravity
alias vaultag='_vault_sync && antigravity vault.code-workspace'

# Default 'vault' command (defaults to VS Code)
alias vault='vaultvs'

alias swww-set="swww img -t grow --transition-step 90"


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

export TERMINAL=kitty
PS1='\[\e[1;37m\][\[\e[1;33m\]\u\[\e[1;37m\]@\[\e[1;36m\]\h \[\e[1;35m\]\w\[\e[1;37m\]]\$ \[\e[0m\]'
alias hack='sudo virsh start kalilinux 2>/dev/null; echo "Waking up Kali..."; until ping -c1 192.168.122.100 >/dev/null 2>&1; do sleep 2; done; TERM=xterm-256color ssh kali -t "sudo mount -t virtiofs shared_data ~/arch_share 2>/dev/null; zsh"'
# Add these after your aliases in ~/.zshrc
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#eval "$(starship init zsh)"
# Faster Starship initialization
if [[ -f ~/.cache/starship_init.zsh ]]; then
    source ~/.cache/starship_init.zsh
else
    starship init zsh > ~/.cache/starship_init.zsh
    source ~/.cache/starship_init.zsh
fi

export PATH=$PATH:/home/timsurreal/.spicetify
export PATH=$PATH:~/.spicetify
export NEWT_COLORS='window=,blue'

e
