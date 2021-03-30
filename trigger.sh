#! /bin/bash

# Set Email and Author environment variables
# Also get path to ssh keys and or specify one directly

git add --all
git commit -am "Changed file $*, Watchman Triggered Commit"
git push
# sleep 5 # throttle cmd in case of unexpected behavior
