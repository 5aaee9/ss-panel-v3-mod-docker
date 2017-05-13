FROM indexyz/docker-php-7

MAINTAINER Indexyz <jiduye@gmail.com>

RUN apt-get update -y && \
    apt-get install libicu-dev libpng-dev libjpeg-dev libbz2-dev git zip unzip -yqq &&\
    docker-php-ext-install gd && \
    rm -rf /var/www && \
    mkdir /var/www && \
    cd /var/www && \
    git clone https://github.com/glzjin/ss-panel-v3-mod.git tmp -b new_master && mv tmp/.git . && rm -rf tmp && git reset --hard && \
    chmod -R 777 * && \
    php composer.phar install && \
    a2enmod rewrite && \
    apt-get remove --purge -y curl build-essential && apt-get autoclean && apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

WORKDIR /var/www
EXPOSE 80
