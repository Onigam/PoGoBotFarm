#!/bin/bash
nohup forever --spinSleepTime 300000 -c python pokecli.py --config config.json > /dev/null 2>&1 &
