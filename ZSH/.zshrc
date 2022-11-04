## Options section
setopt correct                                                  # Auto correct mistakes
setopt extendedglob                                             # Extended globbing. Allows using regular expressions with *
setopt nocaseglob                                               # Case insensitive globbing
setopt rcexpandparam                                            # Array expension with parameters
setopt nocheckjobs                                              # Don't warn about running processes when exiting
setopt numericglobsort                                          # Sort filenames numerically when it makes sense
setopt nobeep                                                   # No beep
setopt appendhistory                                            # Immediately append history instead of overwriting
setopt histignorealldups                                        # If a new command is a duplicate, remove the older one
setopt autocd                                                   # if only directory path is entered, cd there.

HISTFILE=~/.zhistory
HISTSIZE=1000
SAVEHIST=500
#export VISUAL=/usr/bin/nano
WORDCHARS=${WORDCHARS//\/[&.;]}                                 # Don't consider certain characters part of the word

## Keybindings section
bindkey -e
bindkey '^[[7~' beginning-of-line                               # Home key
bindkey '^[[H' beginning-of-line                                # Home key
bindkey '^[[1~' beginning-of-line                               # Home key
 
if [[ "${terminfo[khome]}" != "" ]]; then
  bindkey "${terminfo[khome]}" beginning-of-line                # [Home] - Go to beginning of line
fi
bindkey '^[[8~' end-of-line                                     # End key
bindkey '^[[F' end-of-line                                     # End key
bindkey '^[[4~' end-of-line                                     # End key
if [[ "${terminfo[kend]}" != "" ]]; then
  bindkey "${terminfo[kend]}" end-of-line                       # [End] - Go to end of line
fi
bindkey '^[[2~' overwrite-mode                                  # Insert key
bindkey '^[[3~' delete-char                                     # Delete key
bindkey '^[[C'  forward-char                                    # Right key
bindkey '^[[D'  backward-char                                   # Left key
bindkey '^[[5~' history-beginning-search-backward               # Page up key
bindkey '^[[6~' history-beginning-search-forward                # Page down key

# Navigate words with ctrl+arrow keys
bindkey '^[Oc' forward-word                                     #
bindkey '^[Od' backward-word                                    #
bindkey '^[[1;5D' backward-word                                 #
bindkey '^[[1;5C' forward-word                                  #
bindkey '^H' backward-kill-word                                 # delete previous word with ctrl+backspace
bindkey '^[[Z' undo                                             # Shift+tab undo last action

# enable substitution for prompt
setopt prompt_subst

# Color man pages
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESS=-r

# bind UP and DOWN arrow keys to history substring search
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey '^[[A' history-substring-search-up			
bindkey '^[[B' history-substring-search-down

##### MY CONFIG #####

# Exports {
export PATH=$PATH:$HOME/.bin/:$HOME/.local/bin:$HOME/Downloads/IDEA/bin:$HOME/Downloads/Pycharm/bin:$HOME/.local/share/coursier/bin:$HOME/Documents/Scripts:$HOME/.cargo/bin
export EDITOR=/usr/bin/vim
# }

# Aliases {
 if [ -f ~/.zsh/aliases ]; then
     source ~/.zsh/aliases
 else
     print "404: ~/.zsh/aliases not found."
 fi
# }

# Plugins {
#
 ## zsh-history-substring-search
 [[ -s $HOME/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh ]] && source $HOME/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh 2>/dev/null

 ## zsh-autosuggestions

 [[ -s $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh  2> /dev/null
 zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
 zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
 zstyle ':completion:*' rehash true                              # automatically find new executables in path 
 # Speed up completions
 zstyle ':completion:*' accept-exact '*(N)'
 zstyle ':completion:*' use-cache on
 zstyle ':completion:*' cache-path ~/.zsh/cache

 ## zsh-syntax-highlighting
 [[ -s $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

 [[ -s /usr/share/autojump/autojump.sh ]] && source /usr/share/autojump/autojump.sh 
# }

# autoload -U compinit colors zcalc
# compinit -u
# colors

#Uses tmux by default
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi
 
eval "$(starship init zsh)" # Use Starship prompt

# Set zsh time format
TIMEFMT=$'\t%E real\n\t%U user\n\t%S sys'

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
