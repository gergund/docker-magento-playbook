FROM centos:centos6
MAINTAINER GergunD <gergund@gmail.com>

RUN yum install -y wget
#RUN wget -t 5 --retry-connrefused --waitretry=1  https://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-2.noarch.rpm
RUN wget -t 5 --retry-connrefused --waitretry=1 https://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
#RUN yum localinstall -y epel-release-7-2.noarch.rpm
RUN yum localinstall -y epel-release-6-8.noarch.rpm
RUN yum --enablerepo=epel install -y ansible
RUN yum install -y git
RUN yum update -y

###
#Deploy magento code before running container
###

RUN mkdir -p /var/www/magento
ADD magento-code.tar.gz /var/www/magento

RUN mkdir /provisioning
WORKDIR /provisioning/
RUN git clone https://github.com/gergund/docker-magento-playbook.git .
ADD _afterRun.sh _afterRun.sh
RUN ansible-playbook magento_playbook.yml --connection=local

EXPOSE 80 443

CMD ["/usr/bin/supervisord","-c","/etc/supervisord.conf"]
