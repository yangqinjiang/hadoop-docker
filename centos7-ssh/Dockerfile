#将生成一个名为centos7-ssh的镜像，可以通过docker images查看

FROM centos:7
MAINTAINER yangqinjiang@qq.com

ENV TZ Asia/Shanghai

RUN yum install -y openssh-server sudo && \
    sed -i 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config && \
    yum install -y openssh-clients && \
    yum clean all && \
    echo "root:qwe123" | chpasswd && \
    echo "root  ALL=(ALL)    ALL" >> /etc/sudoers && \
    rm -f /etc/ssh/ssh_host_dsa_key /etc/ssh/ssh_host_rsa_key /root/.ssh/id_rsa && \
    ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_dsa_key && \
    ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key && \
    ssh-keygen -q -N "" -t rsa -f /root/.ssh/id_rsa && \
    cp /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys && \
    mkdir /var/run/sshd  && \
    ln -fs /usr/share/zoneinfo/${TZ} /etc/localtime &&  \
    echo ${TZ} > /etc/timezone
# 自定义了该镜像的时间格式及时区 https://www.jb51.net/article/99906.htm

ADD ssh_config /root/.ssh/config
RUN chmod 600 /root/.ssh/config
RUN chown root:root /root/.ssh/config
# fix the 254 error code
RUN sed  -i "/^[^#]*UsePAM/ s/.*/#&/"  /etc/ssh/sshd_config
RUN echo "UsePAM no" >> /etc/ssh/sshd_config
RUN echo "Port 2122" >> /etc/ssh/sshd_config

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

#以centos镜像为基础，设置密码为wqe123，安装ssh服务并启动
