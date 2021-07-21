#以上面生成的centos7-ssh为基础，将hadoop和jdk包放进去，然后配好环境变量。

FROM yangqinjiang/centos7-base:latest as build
ENV HADOOP_VERSION=2.7.7
ADD hadoopfiles/jdk-8u65-linux-x64.tar.gz /usr/local/
ADD hadoopfiles/hadoop-${HADOOP_VERSION}.tar.gz /usr/local/


FROM yangqinjiang/centos7-base:latest
ENV HADOOP_VERSION=2.7.7
COPY --from=build /usr/local/jdk1.8.0_65 /usr/local/jdk1.8
COPY --from=build /usr/local/hadoop-${HADOOP_VERSION} /usr/local/hadoop-${HADOOP_VERSION}
RUN yum install -y which sudo && yum clean all 
WORKDIR /usr/local
RUN ln -s /usr/local/hadoop-${HADOOP_VERSION} /usr/local/hadoop
RUN ln -s /usr/local/jdk1.8 /usr/local/jdk

ENV JAVA_HOME /usr/local/jdk
ENV PATH $JAVA_HOME/bin:$PATH
ENV HADOOP_HOME /usr/local/hadoop
ENV PATH $HADOOP_HOME/bin:$PATH

# HADOOP的目录
ENV HADOOP_HOME /usr/local/hadoop
ENV HADOOP_COMMON_HOME /usr/local/hadoop
ENV HADOOP_HDFS_HOME /usr/local/hadoop
ENV HADOOP_MAPRED_HOME /usr/local/hadoop
ENV HADOOP_YARN_HOME /usr/local/hadoop
ENV HADOOP_CONF_DIR /usr/local/hadoop/etc/hadoop
ENV YARN_CONF_DIR /usr/local/hadoop/etc/hadoop
# hadoop的运行日志目录
ENV HADOOP_LOG_DIR /var/log/hadoop
RUN mkdir /var/log/hadoop
# 修改hadoop的环境配置
RUN sed -i '/^export JAVA_HOME/ s:.*:export JAVA_HOME=/usr/local/jdk\nexport HADOOP_HOME=/usr/local/hadoop\n:' $HADOOP_CONF_DIR/hadoop-env.sh
RUN sed -i '/^export HADOOP_CONF_DIR/ s:.*:export HADOOP_CONF_DIR=/usr/local/hadoop/etc/hadoop/:' $HADOOP_CONF_DIR/hadoop-env.sh
# 备份原来的配置文件
RUN mkdir $HADOOP_HOME/input
RUN cp $HADOOP_CONF_DIR/*.xml $HADOOP_HOME/input
# 添加自定义的配置文件
ADD conf/core-site.xml $HADOOP_CONF_DIR/core-site.xml
ADD conf/hdfs-site.xml $HADOOP_CONF_DIR/hdfs-site.xml
ADD conf/mapred-site.xml $HADOOP_CONF_DIR/mapred-site.xml
ADD conf/yarn-site.xml $HADOOP_CONF_DIR/yarn-site.xml
ADD conf/log4j.properties $HADOOP_CONF_DIR/log4j.properties

# 初始化namenode
RUN $HADOOP_HOME/bin/hdfs namenode -format

# workingaround docker.io build error
RUN ls -la $HADOOP_CONF_DIR/*-env.sh
RUN chmod +x $HADOOP_CONF_DIR/*-env.sh
RUN ls -la $HADOOP_CONF_DIR/*-env.sh



# Hdfs ports
EXPOSE 9000 50010 50020 50070 50075 50090
# See https://issues.apache.org/jira/browse/HDFS-9427
EXPOSE 9871 9870 9820 9869 9868 9867 9866 9865 9864
# Mapred ports
EXPOSE 19888
#Yarn ports
EXPOSE 8030 8031 8032 8033 8040 8042 8088 8188
#Other ports
EXPOSE 49707 2122