#!/bin/bash
sleep 20
echo "running master, regionserver"

/usr/local/hbase/bin/start-hbase.sh

while true; do
    sleep 1000
    echo "."
done
# /usr/local/hbase/bin/hbase-daemon.sh start master
# /usr/local/hbase/bin/hbase-daemon.sh start regionserver
