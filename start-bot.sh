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

touch config-${USER}.json
echo "{\"walk\": 8,\"auth_service\":\"ptc\", \"username\":\"${USER}\", \"password\":\"${PASSWORD}\", \"location\":\"${LOCATION}\", \"gmapkey\":\"AIzaSyAM63b9XvA6TeyrSTji5rWBLE_6eJxZgwU\", \"max_steps\":5, \"test\": false, \"initial_transfer\": 0, \"location_cache\": true, \"distance_unit\": \"km\", \"item_filter\": \"101,102,103,104\",\"evolve_all\": \"all\"}" > config-${USER}.json
nohup forever --spinSleepTime 10000 --minUptime 9999999999999999999 -c python pokecli.py --config config-${USER}.json > logs/log-${USER}.log 2>&1&
echo Bot ${USER} Started
