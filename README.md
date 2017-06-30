# ss-panel-v3-mod-docker
本项目是 [ss-panel-v3-mod](https://github.com/esdeathlove/ss-panel-v3-mod) 的 docker 映像

## 使用
```
docker run -d -p 80:80 \
    -v $(pwd)/config:/data/www/config
    indexyz/ss-panel-v3-mod-docker
```
然后编辑在/config下的`.config.php`

## 问题
1. 定时任务的执行

使用[另外一个映像](https://hub.docker.com/r/indexyz/php-crontab/) 来执行

因为我使用Rancher来进行负载均衡 在调整Scale的时候 如果内置计划任务到映像当中 会执行多次定时任务 所以分到了独立的映像当中去