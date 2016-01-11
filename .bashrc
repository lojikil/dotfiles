export PATH="$PATH:$HOME/.digamma/bin:/usr/local/go/bin:$HOME/bin:$HOME/opt/bin"
export awesome_person="pronto"
export whowashere='pronto was here!'

alias ls='ls -apFG'
alias df='df -h'
alias du='du -h'
alias xo=open
alias muse2md="sed -e 's/^# /1. /' -e 's/^\* /# /' -e 's/^\*\* /## /' -e 's/^\*\*\* /### /' -e 's/\[\([a-zA-Z0-9%\?\-_\.:\/#$]*\) \(.*\)\]/[\2](\1)/g'"
alias listify="awk '$0 ~ /./ && $0 !~ /:/ {print "-",$0} $0 !~ /./ || $0 ~ /:/ {print $0}'"

export PS1="\u@\h[\w]\n\$ "

# book mark stuffs
# simple bookmarking system for bash; not persisted

os=`uname -s`

if [ "$os" = "Darwin" ]; then
    alias xo="open"
elif [ "$os" = "CYGWIN" ]; then
    alias xo="cygstart"
fi

unset os

#declare -A BOOKMARKS
#function b(){ if [ ! "$1" = "" ]; then cd ${BOOKMARKS[$1]} ; fi }
#function addb() { if [ ! "$1" = "" ]; then BOOKMARKS[$1]=`pwd` ; fi }

export PATH="$PATH:$HOME/opt/bin:$HOME/.cabal/bin"

function ve_activate() {
    if [ "$1" != "" -a -d "$HOME/.venv/$1" ]
    then
        source "$HOME/.venv/$1/bin/activate"
    else
        echo "$1 is *not* a valid virtual env"
    fi
}

function ve_create() {
    if [ "$1" != "" -a ! -d "$HOME/.venv/$1" ]
    then
        virtualenv "$HOME/.venv/$1"
        source "$HOME/.venv/$1/bin/activate"
    else
        echo "$1 already exists"
    fi
}

function ve_list() {
    ls -apFG "$HOME/.venv/"
}

# mount storage; from Cygwin, but keeping for posterity

#declare -A mountpoints
#
#mountpoints=(["/home/lojikil/employer"]="C:/Users/lojikil/Desktop/dump"
#             ["/home/lojikil/P42"]="C:/P42/employer"
#             ["/home/lojikil/d"]="C:/Users/lojikil/Downloads")
#
#for key in ${!mountpoints[@]}
#do
#    val=${mountpoints[$key]}
#    f=`df | grep $key`
#    if [ "$f" = "" ]
#    then
#        mount $val $key
#    fi
#done
#
#unset f
