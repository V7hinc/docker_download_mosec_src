FROM centos:7

# 利用外国网络下载git源码

RUN set -x;\
# 更新
yum update;\
# 安装必要组件
yum -y install git wget

WORKDIR /usr/local/src
RUN set -x;\
# 下载libmodsecurity源码
git clone --depth 1 -b v3/master --single-branch https://github.com/SpiderLabs/ModSecurity;\
cd ModSecurity/;\
git submodule init;\
git submodule update

WORKDIR /usr/local/src
RUN set -x;\
# 下载ModSecurity和Nginx的连接器源码
git clone --depth 1 https://github.com/SpiderLabs/ModSecurity-nginx.git;\
# 下载owasp crs规则
git clone https://github.com/SpiderLabs/owasp-modsecurity-crs.git


VOLUME ["/usr/local/src"]

CMD ["/bin/bash"]
