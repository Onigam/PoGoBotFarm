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

cp ../config.json config-${USER}.json
sed -i "s/AUTH_SERVICE/ptc/g" config-${USER}.json
sed -i "s/ACCOUNT/${USER}/g" config-${USER}.json
sed -i "s/PWD/${PASSWORD}/g" config-${USER}.json
sed -i "s/LOCATION/${LOCATION}/g" config-${USER}.json
sed -i "s/GMAPKEY/AIzaSyAM63b9XvA6TeyrSTji5rWBLE_6eJxZgwU/g" config-${USER}.json
nohup forever --spinSleepTime 10000 --minUptime 9999999999999999999 -c python pokecli.py --config config-${USER}.json > logs/log-${USER}.log 2>&1&
echo Bot ${USER} Started
