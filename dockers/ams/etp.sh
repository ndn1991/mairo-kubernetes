#!/bin/bash -e

envsubst < mario/mario.vmoptions > tmp.txt; mv -f tmp.txt mario/mario.vmoptions;
envsubst < /mario/extensions/ams-v5/conf/ams-kafka-transaction-log-producer.properties > tmp.txt; mv tmp.txt /mario/extensions/ams-v5/conf/ams-kafka-transaction-log-producer.properties;
envsubst < /mario/extensions/ams-v5/conf/hazelcast.xml > tmp.txt; mv tmp.txt /mario/extensions/ams-v5/conf/hazelcast.xml;
envsubst < /mario/extensions/ams-v5/extension.xml > tmp.txt; mv tmp.txt /mario/extensions/ams-v5/extension.xml;

cd /mario;
./start-mario.sh;