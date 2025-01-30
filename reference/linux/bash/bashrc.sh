#Sample functions
#-------------------------------------------------------------
# Greeting, motd etc. ...
#-------------------------------------------------------------

# Color definitions (taken from Color Bash Prompt HowTo).
# Some colors might look different of some terminals.
# For example, I see 'Bold Red' as 'orange' on my screen,
# hence the 'Green' 'BRed' 'Red' sequence I often use in my prompt.


# Normal Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# Background
On_Black='\e[40m'       # Black
On_Red='\e[41m'         # Red
On_Green='\e[42m'       # Green
On_Yellow='\e[43m'      # Yellow
On_Blue='\e[44m'        # Blue
On_Purple='\e[45m'      # Purple
On_Cyan='\e[46m'        # Cyan
On_White='\e[47m'       # White

NC="\e[m"               # Color Reset


ALERT=${BWhite}${On_Red} # Bold White on red background

export PS1="\[$Green\][\u@\h]\[$Yellow\][\W]\[$NC\][\s-\v]\$ "
export PS2="% \s % "

#-------------------
# Personnal Aliases
#-------------------

alias vi='vim'
alias h='history'
alias j='jobs -l'
alias which='type -a'
alias ..='cd ..;pwd'
alias .1='cd ..;pwd'
alias .2='cd ../../;pwd'
alias .3='cd ../../../;pwd'
alias .4='cd ../../../../;pwd'
alias .5='cd ../../../../../;pwd'
alias cls='clear'
alias pc='ps -auxww'

# Pretty-print of some PATH variables:
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'
alias proxy='env | grep -i proxy'

alias untarz='/bin/tar xvfz'
alias untar='/bin/tar xvf'
alias ctar='/bin/tar cvf'

#-------------------------------------------------------------
# The 'ls' family (this assumes you use a recent GNU ls).
#-------------------------------------------------------------
# Add colors for filetype and  human-readable sizes by default on 'ls':
alias ls='ls -h --color'
alias lx='ls -lXB'         #  Sort by extension.
alias lk='ls -lSr'         #  Sort by size, biggest last.
alias lt='ls -ltr'         #  Sort by date, most recent last.
alias lc='ls -ltcr'        #  Sort by/show change time,most recent last.
alias lu='ls -ltur'        #  Sort by/show access time,most recent last.
alias ll='ls -l'
alias lh='ls -h'

bind '"\ep"':"\"pwd\C-m\""
bind '"\el"':"\"ls -al --color\C-m\""
bind '"\ed"':"\"df -h .\C-m\""
bind '"\e1"':"\"cd ..\C-m\""
bind '"\e2"':"\"cd ../..\C-m\""
bind '"\e3"':"\"cd ../../..\C-m\""
bind '"\e4"':"\"cd ../../../..\C-m\""
bind '"\e5"':"\"cd ../../../../..\C-m\""

bind '"\eD"':"\"ls -l --color | egrep \"^d\"\C-m\""
bind '"\eF"':"\"ls -l --color | egrep -v \"^d\"\C-m\""
bind '"\e`"':"\"cd ~\C-m\""
bind '"\e-"':"\"cd -\C-m\""

bind '"\ek"':"\"kubectl \""
bind '"\em"':"\"microk8s \""
bind '"\ez"':"\"microk8s stop\""
bind '"\ex"':"\"microk8s start\""
bind '"\ef"':"\" --grace-period=0 --force\""
bind '"\ej"':"\" -p '{"metadata":{"finalizers":null}}'\""

# git aliases
alias gl='git log --oneline'
alias gsl='git stash list'
alias gp='git pull'
alias gc='git checkout'
alias gs='git status'
alias gb='git branch'

#wsl
alias wslt='wsl -t Ubuntu-22.04'
alias wsltr='wsl -t Ubuntu-16.04'
alias wsll='wsl -l -v'
alias wsls='wsl --shutdown'
alias mail='echo "brahan@gmail.com" | clip.exe'

alias devpod='podman run -it --rm --name sandbox -e "TERM=xterm-256color" -v /sandbox/test:/sandbox/test -v $HOME/.m2:/root/.m2 -u root cpppythondevelopment/base:latest /bin/bash'

blue=$(tput setaf 4)
normal=$(tput sgr0)

function join { local IFS="$1"; shift; echo "$*"; }
function joinby { local d=$1; shift; echo -n "$1"; shift; printf "%s" "${@/#/$d}"; }

function log() {
    printf "[INFO][%s] %s\n" $(date +%d-%m-%Y\ %T) "$@"
}

function err() {
    printf "[ERROR][%s] %s\n" $(date +%d-%m-%Y\ %T) "$@"
}

function execcmd()
{
    local cmd=("$@")
    local start=$(perl -e 'print time')
    echo "[$(date +%d-%m-%Y\ %T)]Executing : ${cmd[@]}"
    "${cmd[@]}"
    local rtn=$?
    local end=$(perl -e 'print time')
    local tot=$(($end-$start))
    local min=$(($tot / 60))
    local sec=$(($tot % 60))

    echo "[$(date +%d-%m-%Y\ %T)]Completed : ${cmd[@]} "
    echo "[$(date +%d-%m-%Y\ %T)]Return value : $rtn"
    if [ $min -gt 0 ]; then
        echo "[$(date +%d-%m-%Y\ %T)]Time taken : $min minute(s) $sec second(s)"
    else
        echo "[$(date +%d-%m-%Y\ %T)]Time taken :  $sec second(s)"
    fi
    return $rtn
}

function execcmd_with_timeout() {
    local sec=$1
    local cmd=$2
    local redirect=$3

    if [ -z "$redirect" ]; then
        expect -c "set echo '-noecho'; set timeout $sec; spawn -noecho $cmd; expect timeout { exit 124 } eof { exit 0 };"
        exitcode=$?
    else
        expect -c "set echo '-noecho'; set timeout $sec; spawn -noecho $cmd; expect timeout { exit 124 } eof { exit 0 };" 2>&1 | tee ${redirect}
        exitcode=$?
    fi
    return $exitcode;
}

function addpath() {
    local newpath=""
    local gp=""
    while [ "$#" -gt "0" ]
    do
        local pathfound=$(echo -e ${PATH//:/\\n} | grep "^${1}$" | wc -l)
        if [ $pathfound == "0" ]; then
            newpath="${newpath}:${1}"
        fi
        gp="${gp} -e :${1}"
        shift 1
    done
    if [ ! -z "$newpath" ]; then
        export PATH=$PATH$newpath
    fi
    #echo "PATH:"
    #echo $PATH | grep --color $gp
}

function checkexit()
{
    local r=$1

    if [ $r -ne 0 ]; then
        while true
        do
            read -p "Task failed : Press q to quit, c to continue : " input
            if [ ! -z "$input" ]; then
                if [ "$input" == "q" ]; then
                    exit $r
                elif [ "$input" == "c" ]; then
                    return 0
                fi
            fi
        done
    fi
}

function abspath()
{
    if [ ! -z "$1" ]; then
        cd $1 &> /dev/null
        if [ $? -eq 0 ]; then
            pwd
            cd - &> /dev/null
        fi
    else
        pwd
    fi
}

function ldr()
{
    local sep='\n'
    local dir=""
    if [ ! -z "$2" ]; then
        sep=$2
    elif [ -d "$1" ]; then
        if [ ! -z "$2" ]; then
            sep=$2
        fi
        dir=$1
        cd $dir
    else
        tmp=$(abspath $1)
        if [ ! -z "$tmp" ]; then
            dir=$tmp
        elif [ ! -z $1 ]; then
            sep=$1
        fi
    fi
    local str=""
    for d in $(ls )
    do
        if [ -d "$d" ]; then
            str=${str}${d}${sep}
        fi
    done

    if [ -d "$dir" ]; then
        cd -
    fi
    printf "${blue}${str:0:(${#str}-${#sep})}\n${normal}"
}

function ubencode()
{
    local enpass=""
    local pass=""

    read -s -p $'Enter password to be encoded:\n' pass
    read -s -p $'Enter password for encoding:\n' enpass

    echo "${pass}" |  openssl aes-256-cbc -a -md sha512 -pbkdf2 -iter 1000000 -salt -pass pass:${enpass} | tee ~/.ubpass
}

function ubdecode()
{
    local enpass=""
    local decode=""
    read -s -p $'Enter password for decoding:\n' enpass

    decode=$(cat ~/.ubpass | openssl aes-256-cbc -d -a -md sha512 -pbkdf2 -iter 1000000 -pass pass:${enpass})
    echo "${decode}"
}


function ssoencode()
{
    local enpass=""
    local pass=""

    read -s -p $'Enter password to be encoded:\n' pass
    read -s -p $'Enter password for encoding:\n' enpass

    echo "${pass}" |  openssl aes-256-cbc -a -md sha512 -pbkdf2 -iter 1000000 -salt -pass pass:${enpass} | tee ~/.ssopass
}

function ssodecode()
{
    local enpass=""
    local decode=""
    read -s -p $'Enter password for decoding:\n' enpass

    decode=$(cat ~/.ssopass | openssl aes-256-cbc -d -a -md sha512 -pbkdf2 -iter 1000000 -pass pass:${enpass})
    echo "${decode}"
}

function restartdp()
{
    local dp=${1}
    local ns=${2:-default}
    kubectl rollout restart deployment ${dp} -n ${ns}
}

function scaledp()
{
    local r=${1:-1}
    local dp=${2}
    local ns=${3:-default}

    kubectl scale deploy -n ${ns} --replicas=${r} ${dp}
}

function stopdp()
{
    local dp=${1}
    local ns=${2:-default}

    scaledp 0 ${dp} ${ns}
}

function podcp() {
    local pod=$1
    local ns=$2

    if [ -z "${ns}" ]; then
        ns=brahan
    fi

    if [ ! -z "${pod}" ]; then
        while read -r bin;
        do
            local src=$(find /delivery -name "${bin}" 2>/dev/null | tail -1)
            if [ -f "${src}" ]; then
                echo "kubectl cp ${src} ${ns}/${pod}:/opt/app/bin/${bin}"
                kubectl cp "${src}" ${ns}/${pod}:/opt/app/bin/${bin}
            fi
        done < <(cat ~/work/debug/cpbin)
        while read -r lib;
        do
            local src=$(find /delivery -name "${lib}" 2>/dev/null | tail -1)
            if [ -f "${src}" ]; then
                echo "kubectl cp ${src} ${ns}/${pod}:/opt/app/lib/${lib}"
                kubectl cp "${src}" ${ns}/${pod}:/opt/app/lib/${lib}
            fi
        done < <(cat ~/work/debug/cplib)
    fi
}
