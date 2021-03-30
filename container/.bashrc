WORKDIR=$(pwd)

alias list="watchman watch-list"
alias start="watchman watch $WORKDIR"
alias stop="watchman watch-del $WORKDIR"
alias trigger="watchman -- trigger $WORKDIR trigger_name * -- $WORKDIR/trigger.sh"
alias triggers="watchman trigger-list $WORKDIR"
alias state="cat /var/watchman/$USER-state/state"
alias log="cat /var/watchman/$USER-state/log"
alias monitor="tail -f /var/watchman/$USER-state/log"
