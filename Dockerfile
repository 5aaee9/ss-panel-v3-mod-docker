FROM indexyz/docker-php-7

MAINTAINER Indexyz <jiduye@gmail.com>

RUN apt-get update -y && \
    apt-get install libicu-dev libpng-dev libjpeg-dev libbz2-dev -yqq &&\
    docker-php-ext-install gd && \
    apt-get remove --purge -y curl build-essential && apt-get autoclean && apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 
