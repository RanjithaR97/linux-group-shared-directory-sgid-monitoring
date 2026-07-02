#!/bin/bash
DIR="/home/devshare"
LOGFILE="/home/ranjitha/devshare_monitor.log"
echo "===== Monitoring Started =====" >> "$LOGFILE"
date >> "$LOGFILE"
for file in "$DIR"/*
do
if [ -f "$file" ]
then
GROUP=$(stat -c %G "$file")
    if [ "$GROUP" = "developers" ]
    then
        echo "$(basename "$file") : Correct Group" >> "$LOGFILE"
    else
        echo "$(basename "$file") : WRONG GROUP ($GROUP)" >> "$LOGFILE"
    fi
fi
done
echo "=============================" >> "$LOGFILE"
