#!/bin/bash -e

envsubst < mario/mario.vmoptions > tmp.txt; mv -f tmp.txt mario/mario.vmoptions;
cd /mario;
./start-mario.sh;