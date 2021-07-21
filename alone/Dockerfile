FROM yangqinjiang/hadoop-base:latest
MAINTAINER yangqinjiang@qq.com

ENV HADOOP_CONF_DIR /usr/local/hadoop/etc/hadoop
# 添加自定义的配置文件
ADD conf/core-site.xml $HADOOP_CONF_DIR/core-site.xml
ADD conf/hdfs-site.xml $HADOOP_CONF_DIR/hdfs-site.xml
ADD conf/mapred-site.xml $HADOOP_CONF_DIR/mapred-site.xml
ADD conf/yarn-site.xml $HADOOP_CONF_DIR/yarn-site.xml
ADD conf/log4j.properties $HADOOP_CONF_DIR/log4j.properties

# 加入启动脚本
ADD bootstrap.sh /etc/bootstrap.sh
RUN chown root:root /etc/bootstrap.sh
RUN chmod 700 /etc/bootstrap.sh

ENV BOOTSTRAP /etc/bootstrap.sh
# -d: 保持前台运行
# -bash: 使用/bin/bash 保持前台运行
CMD ["/etc/bootstrap.sh","-d"] 