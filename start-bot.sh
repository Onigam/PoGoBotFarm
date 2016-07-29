#!/bin/bash
for i in "$@"
do
case $i in
    -u=*|--user=*)
    USER="${i#*=}"

    ;;
    -p=*|--password=*)
    PASSWORD="${i#*=}"
    ;;
    -l=*|--location=*)
    LOCATION="${i#*=}"
    ;;
    --default)
    DEFAULT=YES
    ;;
    *)
            # unknown option
    ;;
esac
done
echo Installing new bot environment...
echo USER = ${USER}
echo PASSWORD = ${PASSWORD}
echo LOCATION = ${LOCATION}

rm -Rf PokemonGo-Bot-${USER}
git clone https://github.com/Onigam/PokemonGo-Bot PokemonGo-Bot-${USER}
cd PokemonGo-Bot-${USER}
touch config.json
echo "{\"walk\": 8,\"auth_service\":\"ptc\", \"username\":\"${USER}\", \"password\":\"${PASSWORD}\", \"location\":\"${LOCATION}\", \"gmapkey\":\"AIzaSyAM63b9XvA6TeyrSTji5rWBLE_6eJxZgwU\", \"max_steps\":5, \"test\": false, \"initial_transfer\": 0, \"location_cache\": true, \"distance_unit\": \"km\", \"item_filter\": \"101,102,103,104\",\"evolve_all\": \"all\"}" > config.json
mv release_config.json.example release_config.json
pwd
cp ../init.sh init.sh
cp ../start.sh start.sh
sudo sh ./init.sh
sudo sh ./start.sh
echo Bot ${USER} Started
