export GPG_TTY=$(tty)

if [ -d /opt/homebrew/opt/chruby ]; then
  source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
  source /opt/homebrew/opt/chruby/share/chruby/auto.sh
  chruby ruby-3.3.0 # run chruby to see actual version
fi

if [ -d $HOME/.pyenv ]; then
  export PYENV_ROOT="$HOME/.pyenv"
  [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi

if which nvim >/dev/null; then
  function use-nvim  {
    alias vim="nvim"
    alias vi="nvim"
    alias view="nvim -R"
  }
fi

function ya() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

if which starship > /dev/null; then
  eval "$(starship init zsh)"
fi

