#!/bin/bash

cat users.csv | while read line
do
        USERNAME=$(echo "$line" | cut -d';' -f1)    # get the user name
        PASSWORD=$(echo "$line" | cut -d';' -f2)    # get the password
        LOCATION=$(echo "$line" | cut -d';' -f3)    # get the location
        echo "$USERNAME $PASSWORD $LOCATION"
        sh ./start-bot.sh -u=$USERNAME -p=$PASSWORD -l=$LOCATION
done
