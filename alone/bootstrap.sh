#!/bin/bash
date

: ${HADOOP_PREFIX:=/usr/local/hadoop}

$HADOOP_PREFIX/etc/hadoop/hadoop-env.sh

rm /tmp/*.pid

nohup $HADOOP_PREFIX/bin/hdfs namenode 2>>/var/log/hadoop/namenode.err >>/var/log/hadoop/namenode.out &
# nohup $HADOOP_PREFIX/bin/yarn resourcemanager 2>>/var/log/hadoop/resourcemanager.err >>/var/log/hadoop/resourcemanager.out &
# nohup $HADOOP_PREFIX/bin/mapred historyserver 2>>/var/log/hadoop/historyserver.err >>/var/log/hadoop/historyserver.out &
nohup $HADOOP_PREFIX/bin/hdfs datanode 2>>/var/log/hadoop/datanode.err >>/var/log/hadoop/datanode.out &
# nohup $HADOOP_PREFIX/bin/yarn nodemanager 2>>/var/log/hadoop/nodemanager.err >>/var/log/hadoop/nodemanager.out &
nohup /usr/sbin/sshd -D
# -d: 保持前台运行
# -bash: 使用/bin/bash 保持前台运行

if [[ $1 == "-d" ]]; then
    while true; do
        sleep 1000
        echo "."
    done
fi

if [[ $1 == "-bash" ]]; then
    /bin/bash
fi
