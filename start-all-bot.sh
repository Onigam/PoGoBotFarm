#!/bin/bash

source ./stop-all-bot.sh
rm -Rf PokemonGo-Bot
git clone --recursive -b dev https://github.com/PokemonGoF/PokemonGo-Bot.git PokemonGo-Bot
cd PokemonGo-Bot
mkvirtualenv PokeBotPyEnv
pip install -r requirements.txt
mv release_config.json.example release_config.json
mkdir logs

cat ../users.csv | while read line
do
        USERNAME=$(echo "$line" | cut -d';' -f1)    # get the user name
        PASSWORD=$(echo "$line" | cut -d';' -f2)    # get the password
        LOCATION=$(echo "$line" | cut -d';' -f3)    # get the location
        echo "$USERNAME $PASSWORD $LOCATION"
        source ../start-bot.sh -u=$USERNAME -p=$PASSWORD -l=$LOCATION
done

cd ..
