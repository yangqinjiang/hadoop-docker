FROM hadoop:latest
MAINTAINER yangqinjiang@qq.com

# 加入启动脚本
ADD bootstrap.sh /etc/bootstrap.sh
RUN chown root:root /etc/bootstrap.sh
RUN chmod 700 /etc/bootstrap.sh

ENV BOOTSTRAP /etc/bootstrap.sh
# -d: 保持前台运行
# -bash: 使用/bin/bash 保持前台运行
CMD ["/etc/bootstrap.sh","-d"] 