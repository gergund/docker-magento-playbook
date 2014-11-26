FROM centos:centos7
MAINTAINER GergunD <gergund@gmail.com>

RUN yum install -y wget chown
RUN wget -t 5 --retry-connrefused --waitretry=1  https://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-2.noarch.rpm
RUN yum localinstall -y epel-release-7-2.noarch.rpm
RUN yum --enablerepo=epel install -y ansible
RUN yum install -y git
RUN yum update -y

###
#Deploy magento code before running container
###

RUN mkdir -p /var/www/magento
ADD magento-code.tar.gz /var/www/magento
RUN chown -R apache:apache /var/www/

RUN mkdir /provisioning
WORKDIR /provisioning/
ADD _afterRun.sh
RUN git clone https://github.com/gergund/docker-magento-playbook.git .
RUN ansible-playbook magento_playbook.yml --connection=local

EXPOSE 80 443

CMD ["/usr/bin/supervisord","-c","/etc/supervisord.conf"]
