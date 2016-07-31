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

cp ../config.json .
mv release_config.json.example release_config.json
pwd
cp ../init.sh init.sh
cp ../start.sh start.sh
sudo sh ./init.sh
sudo sh ./start.sh
echo Bot ${USER} Started
