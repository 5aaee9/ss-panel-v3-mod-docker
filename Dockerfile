FROM indexyz/docker-php-7

MAINTAINER Indexyz <jiduye@gmail.com>

RUN yum install git zip unzip -y &&\
    rm -rf /data/www && \
    mkdir /data/www && \
    cd /data/www && \
    git clone https://github.com/glzjin/ss-panel-v3-mod.git tmp -b new_master && mv tmp/.git . && rm -rf tmp && git reset --hard && \
    chmod -R 777 * && \
    /usr/local/php/bin/php composer.phar install && \
    rm -rf /tmp/* /var/tmp/* && yum clean all

WORKDIR /var/www
EXPOSE 80
