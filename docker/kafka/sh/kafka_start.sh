#!/bin/bash

if [ $MODE == 'server' ]; then
	/kafka/bin/kafka-server-start.sh /kafka/config/server.properties
elif [ $MODE == 'zookeeper' ]; then
	/kafka/bin/zookeeper-server-start.sh /kafka/config/zookeeper.properties
fi