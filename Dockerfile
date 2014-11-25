FROM centos:centos7
MAINTAINER GergunD <gergund@gmail.com>

RUN yum install -y https://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-2.noarch.rpm
RUN yum --enablerepo=epel install -y ansible
RUN yum install -y git
RUN yum update -y

RUN mkdir /provisioning
WORKDIR /provisioning/
RUN git clone https://github.com/gergund/docker-magento-playbook.git .
RUN ansible-playbook magento_playbook.yml --connection=local

EXPOSE 80 443

CMD ["/usr/sbin/nginx","-c","/etc/nginx/nginx.conf"]
CMD ["/usr/sbin/php-fpm","-c","/etc/php-fpm.conf"]

