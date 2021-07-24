
FROM yangqinjiang/centos7-base:latest as build
ENV HBASE_VERSION=1.3.1
ADD hbasefiles/jdk-8u65-linux-x64.tar.gz /usr/local/
ADD hbasefiles/hbase-${HBASE_VERSION}-bin.tar.gz /usr/local/


FROM yangqinjiang/centos7-base:latest
ENV HBASE_VERSION=1.3.1
COPY --from=build /usr/local/jdk1.8.0_65 /usr/local/jdk1.8
COPY --from=build /usr/local/hbase-${HBASE_VERSION} /usr/local/hbase-${HBASE_VERSION}
RUN yum install -y which sudo && yum clean all 
WORKDIR /usr/local
RUN ln -s /usr/local/hbase-${HBASE_VERSION} /usr/local/hbase
RUN ln -s /usr/local/jdk1.8 /usr/local/jdk

ENV JAVA_HOME /usr/local/jdk
ENV PATH $JAVA_HOME/bin:$PATH
#HBASE的目录
ENV HBASE_HOME /usr/local/hbase
ENV PATH $HBASE_HOME/bin:$PATH

ENV HBASE_CONF_DIR $HBASE_HOME/conf

# 修改hbase的环境配置
RUN sed -i '/^# export JAVA_HOME/ s:.*:export JAVA_HOME=/usr/local/jdk\nexport HBASE_MANAGES_ZK=false\n:' $HBASE_CONF_DIR/hbase-env.sh


# 添加hbase的配置文件
ADD conf/hbase-site.xml $HBASE_CONF_DIR/hbase-site.xml
ADD conf/core-site.xml $HBASE_CONF_DIR/core-site.xml
ADD conf/hdfs-site.xml $HBASE_CONF_DIR/hdfs-site.xml

ADD conf/regionservers $HBASE_CONF_DIR/regionservers

COPY conf/run.sh /run.sh
RUN chmod +x /run.sh
RUN mkdir -p /data2

# Hbase ports
# Master port
EXPOSE 16000 16010 16201 16301

CMD [ "/run.sh" ]

