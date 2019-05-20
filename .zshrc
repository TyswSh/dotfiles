export PATH="$HOME/bin:$PATH"

# 色を使用
autoload -Uz colors
colors
zstyle ':completion:*' verbose yes
zstyle ':completion:*' list-colors "${LS_COLORS}"
# 補完
autoload -Uz compinit
compinit

zstyle ':completion:*' menu select
# ヒストリーを作成と重複を表示しない
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# cdのコマンド省略して、ディレクトリ名のみで移動
setopt auto_cd

# コマンドミスを修正
setopt correct

# エイリアスの設定
alias la='ls -la --color=auto'
alias v='nvim'
alias vz='nvim ~/.zshrc'
alias vinit='nvim ~/.config/nvim/init.vim'

# cdのあとにlsを実行
chpwd(){ ls -ltr --color=auto }

# プロンプトを2行で表示、時刻を表示
PROMPT="%(?.%{${fg[green]}%}.%{${fg[red]}%})%n${reset_color}@${fg[blue]}%m${reset_color}(%*%) %~
%# "

