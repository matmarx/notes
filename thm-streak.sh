#!/bin/bash
# Streak checker
STREAK=$(curl -s https://tryhackme.com/api/v2/public-profile\?username\=matmar | jq | grep streak | grep -o '[0-9]\+')
DAYS_SINCE=$(( ($(date +%s) - $(date -j -f "%Y-%m-%d" "2020-04-27" +%s)) / 86400 ))
notify(){ echo "setup notify option"; }
[[ $STREAK -eq $DAYS_SINCE ]] && echo "streak ok" || notify
