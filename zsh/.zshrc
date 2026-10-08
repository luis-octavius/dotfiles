#  Startup 
# Commands to execute on startup (before the prompt is shown)
# Check if the interactive shell option is set
if [[ $- == *i* ]]; then
    # This is a good place to load graphic/ascii art, display system information, etc.
    if command -v pokego >/dev/null; then
        pokego --no-title -r 1,3,6
    elif command -v pokemon-colorscripts >/dev/null; then
        pokemon-colorscripts --no-title -r 1,3,6
    elif command -v fastfetch >/dev/null; then
        if do_render "image"; then
            fastfetch --logo-type kitty
        fi
    fi
fi

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
#   Overrides 
# HYDE_ZSH_NO_PLUGINS=1 # Set to 1 to disable loading of oh-my-zsh plugins, useful if you want to use your zsh plugins system 
# unset HYDE_ZSH_PROMPT # Uncomment to unset/disable loading of prompts from HyDE and let you load your own prompts
# HYDE_ZSH_COMPINIT_CHECK=1 # Set 24 (hours) per compinit security check // lessens startup time
# HYDE_ZSH_OMZ_DEFER=1 # Set to 1 to defer loading of oh-my-zsh plugins ONLY if prompt is already loaded

if [[ ${HYDE_ZSH_NO_PLUGINS} != "1" ]]; then
    #  OMZ Plugins 
    # manually add your oh-my-zsh plugins here
    plugins=(
        "sudo"
    )
fi

# my configuration
export PATH=$PATH:$HOME/go/bin
export EDITOR=nvim
export NVM_DIR="$HOME/.config/nvm"

~/copy-dotfiles.sh

akrasia today

alias curumim='cd /mnt/stuff/Projects/curumim-escola/'
alias curumim-docs='cd ~/Documents/Programming\ Vault/Curumim/'
alias ls='lsd'
alias lsa='lsd -a'
alias akr='akrasia'
alias sourcezsh='source ~/.config/zsh/user.zsh'
alias editzsh='nvim ~/.zshrc'
alias nvcfg='cd ~/.config/nvim'
alias hyprcfg='cd ~/.config/hypr'

export PATH="$PATH:$HOME/.dotnet/tools"

ZSH_THEME=agnoster


