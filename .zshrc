export TERM="xterm-256color"
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

fpath=(~/.zsh/completions $fpath) 
autoload -U compinit && compinit

function sshaws(){
  ssh -i ~/pem-keys/$1.pem ubuntu@$2 
}

function pushconfig(){
  pushd $HOME/Code/machine-setup
  git add .
  git commit
  git push
  popd
}

DEFAULT_COLOR="125"
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_DIR_HOME_BACKGROUND="125"
POWERLEVEL9K_DIR_HOME_FOREGROUND="249"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="125"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="249"
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="125"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="249"
POWERLEVEL9K_STATUS_OK_BACKGROUND="black"
POWERLEVEL9K_STATUS_OK_FOREGROUND="green"
POWERLEVEL9K_STATUS_ERROR_BACKGROUND="black"
POWERLEVEL9K_STATUS_ERROR_FOREGROUND="red"
POWERLEVEL9K_NVM_BACKGROUND="black"
POWERLEVEL9K_NVM_FOREGROUND="249"
POWERLEVEL9K_NVM_VISUAL_IDENTIFIER_COLOR="green"
POWERLEVEL9K_LOAD_CRITICAL_BACKGROUND="black"
POWERLEVEL9K_LOAD_WARNING_BACKGROUND="black"
POWERLEVEL9K_LOAD_NORMAL_BACKGROUND="black"
POWERLEVEL9K_LOAD_CRITICAL_FOREGROUND="249"
POWERLEVEL9K_LOAD_WARNING_FOREGROUND="249"
POWERLEVEL9K_LOAD_NORMAL_FOREGROUND="249"
POWERLEVEL9K_LOAD_CRITICAL_VISUAL_IDENTIFIER_COLOR="red"
POWERLEVEL9K_LOAD_WARNING_VISUAL_IDENTIFIER_COLOR="yellow"
POWERLEVEL9K_LOAD_NORMAL_VISUAL_IDENTIFIER_COLOR="green"
POWERLEVEL9K_HOST_BACKGROUND="125"
POWERLEVEL9K_HOST_FOREGROUND="249"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir dir_writable)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vcs host)

ZSH_THEME="powerlevel9k/powerlevel9k"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git,
  z
)

source /usr/local/Cellar/awscli/1.16.20/libexec/bin/aws_zsh_completer.sh

source ~/.secretstuff

source $ZSH/oh-my-zsh.sh

function getvpcinfobyid() {
    CIDR=$(aws ec2 describe-vpcs | jq --arg VPC_ID "${1}" '.Vpcs[] | select(.VpcId == $VPC_ID) | .CidrBlock' | tr -d '"')
    NAME=$(aws ec2 describe-vpcs | jq --arg VPC_ID "${1}" '.Vpcs[] | select(.VpcId == $VPC_ID) | .Tags[] | select(.Key == "Name") | .Value' | tr -d '"')
    echo VPC Name: $NAME
    echo VPC Id: $1
    echo VPC CIDR Block: $CIDR
}

function getvpcinfobycidr() {
    ID=$(aws ec2 describe-vpcs | jq --arg CIDR "${1}" '.Vpcs[] | select(.CidrBlock == $CIDR) | .VpcId' | tr -d '"')
    NAME=$(aws ec2 describe-vpcs | jq --arg CIDR "${1}" '.Vpcs[] | select(.CidrBlock == $CIDR) | .Tags[] | select(.Key == "Name") | .Value' | tr -d '"')
    echo VPC Name: $NAME
    echo VPC Id: $ID
    echo VPC CIDR Block: $1
}

alias tuturu='toilet -f mono9 -w 150 トウットウル〜！ | lolcat; (ffplay -nodisp -autoexit ~/Downloads/tuturu_1.mp3 2> /dev/null &)'
alias bit='toilet -f mono9 -w 150 BITCONNECT! | lolcat; (ffplay -nodisp -autoexit ~/Downloads/bitconneeeeect.mp3 2> /dev/null &)'
alias nonono='toilet -f mono9 -w 150 HMM NONONO! | lolcat; (ffplay -nodisp -autoexit ~/Downloads/hmm-hmm-no-no-no.mp3 2> /dev/null &)'

alias gitgraph='git log --graph --oneline'
alias resetgoland="rm ~/Library/Preferences/GoLand*/eval/*.key"
alias resetpycharm="rm ~/Library/Preferences/PyCharm*/eval/*.key"
alias fucking=sudo
alias editzshrc="vim ~/.zshrc"
alias srczshrc="source ~/.zshrc"
alias code="cd ~/Code"
alias dps="docker ps"
alias startgirls="say -v Kyoko はじめおか; docker start azusa tsumugi yui mio ritsu"
. ~/.oh-my-zsh/plugins/z/z.sh
alias editlightroomlicense="sudo vim /Library/Application Support/Adobe/Adobe Lightroom Classic CC NGL/AMT/application.xml"
alias editphotoshoplicense="sudo vim /Library/Application\ Support/Adobe/Adobe\ Photoshop\ CC\ 2019/AMT/application.xml"
alias git=hub
function convert2ssh() {
  git remote set-url $1 `git remote get-url $1 | sed s#https://#ssh://git@#g`
}

export GOPATH=$HOME/Code/go
export GOBIN=$GOPATH/bin

export NVM_DIR=$HOME/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH=$PATH:$GOBIN:$HOME/sonar-scanner/bin

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
export QUOTINGLOCUST_RUN_LOCALLY=true

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export PATH="/usr/local/opt/node@8/bin:$PATH"

toilet -f mono9 -w 150 NHKにようこそ！| lolcat

