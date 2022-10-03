# The source for creation of this .zshrc is https://github.com/mattmc3/zsh_unplugged

# ─────────────────── Provides zsh detailed auto completion ────────────────── #
# autoload -U compinit
# compinit

autoload -Uz compinit
compinit -i

zstyle ':completion:*' menu select # select completions with arrow keys
zstyle ':completion:*' group-name '' # group results by category
zstyle ':completion:::::' completer _expand _complete _ignored _approximate #enable approximate matches for completion

#History setup
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE

setopt hist_ignore_all_dups # remove older duplicate entries from history
setopt hist_reduce_blanks # remove superfluous blanks from history items
setopt inc_append_history # save history entries as soon as they are entered
setopt share_history # share history between different instances of the shell
setopt auto_cd # cd by typing directory name if it's not a command
setopt correct_all # autocorrect commands
setopt auto_list # automatically list choices on ambiguous completion
setopt auto_menu # automatically use menu completion
setopt always_to_end # move cursor to end if word had one match

#
#
# This section is the bare-bone plugin manager
# The plugins is saved in to ~/.config/zsh/plugins/zsh_unplugged
#
#

# where do you want to store your plugins?
ZPLUGINDIR=${ZPLUGINDIR:-${ZDOTDIR:-$HOME/.config/zsh}/plugins}

# get zsh_unplugged and store it with your other plugins
if [[ ! -d $ZPLUGINDIR/zsh_unplugged ]]; then
  git clone --quiet https://github.com/mattmc3/zsh_unplugged $ZPLUGINDIR/zsh_unplugged
fi
source $ZPLUGINDIR/zsh_unplugged/zsh_unplugged.zsh

# ─────────────────────────────── Plugins List ─────────────────────────────── #
# make list of the Zsh plugins you use
repos=(
	# plugins that you want loaded first
	sindresorhus/pure
	romkatv/zsh-defer

	# other plugins
	zsh-users/zsh-completions
	rupa/z
	# Aloxaf/fzf-tab
	# ...

	# plugins you want loaded last
	zsh-users/zsh-syntax-highlighting
	zsh-users/zsh-history-substring-search
	zsh-users/zsh-autosuggestions
)
# ────────────────────────── Plugin Update Function ────────────────────────── #
function zsh-plugin-update {
  ZPLUGINDIR=${ZPLUGINDIR:-$HOME/.config/zsh/plugins}
  for d in $ZPLUGINDIR/*/.git(/); do
    echo "Updating ${d:h:t}..."
    command git -C "${d:h}" pull --ff --recurse-submodules --depth 1 --rebase --autostash
  done
}

# ─────────────────────────── Plugin List Function ─────────────────────────── #
function zsh-plugin-list {
    for d in $ZPLUGINDIR/*/.git; do
      git -C "${d:h}" remote get-url origin
    done
}

# ─────────────────────── Hyper Speed Plugins - Compile ────────────────────── #
# What if I want my plugins to be even faster?
# If you are an experienced Zsh user, you may know about zcompile, which takes your Zsh scripts and potentially speeds them up by compiling them to byte code.
function zsh-plugin-compile {
  ZPLUGINDIR=${ZPLUGINDIR:-$HOME/.config/zsh/plugins}
  autoload -U zrecompile
  local f
  for f in $ZPLUGINDIR/**/*.zsh{,-theme}(N); do
    zrecompile -pq "$f"
  done
}

# ──────────────────────────── Remove all Plugins ──────────────────────────── #
function zsh-plugin-remove-all {
	ZPLUGINDIR=~/.config/zsh/plugins
	rm -rf $ZPLUGINDIR
	zsh
}


# ──────────────────────────────────────────────────────────────────────────── #

# ww Section

# ──────────────────────────────────────────────────────────────────────────── #

 # ───────────────────────────── ww - loading PATH ──────────────────────────── #
export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$HOME/.dotfiles/ww-scripts:$PATH
# ────────────────────────────── ww-sourcing files ────────────────────────────── #
[[ -e $HOME/.bash_aliases ]] && source $HOME/.bash_aliases || ln -sf $HOME/.dotfiles/.bash_aliases $HOME/.bash_aliases && source $HOME/.bash_aliases
source /usr/share/fzf/key-bindings.zsh

# ──────────────────────────────── ww-aliases ──────────────────────────────── #
alias -g L='| less'
alias -g G='| grep'
alias -g F='| fzf'

# ────────────────────────────── ww-keymap model ───────────────────────────── #
# bindkey -v
bindkey 'jk' vi-cmd-mode
# bindkey -e jk \\e


# now load your plugins
plugin-load $repos # Don't change the name of this function
