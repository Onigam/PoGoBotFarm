#!/bin/bash
virtualenv .
source bin/activate
pip install -r requirements.txt
git submodule init
git submodule update
echo "Ready to farm!!! Edit and copy config.json"
