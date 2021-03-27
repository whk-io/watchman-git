#! /bin/bash
git add --all
git commit -am "Changed file $*, Watchman Triggered Commit"
git push
# sleep 5 # throttle cmd in case of unexpected behavior
