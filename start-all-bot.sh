#!/bin/bash

./stop-all-bot.sh
rm -Rf PokemonGo-Bot
git clone --recursive -b master https://github.com/Onigam/PokemonGo-Bot PokemonGo-Bot
cd PokemonGo-Bot
pip install -r requirements.txt
mv release_config.json.example release_config.json
mkdir logs

cat ../users.csv | while read line
do
        USERNAME=$(echo "$line" | cut -d';' -f1)    # get the user name
        PASSWORD=$(echo "$line" | cut -d';' -f2)    # get the password
        LOCATION=$(echo "$line" | cut -d';' -f3)    # get the location
        echo "$USERNAME $PASSWORD $LOCATION"
        ../start-bot.sh -u=$USERNAME -p=$PASSWORD -l=$LOCATION
done
