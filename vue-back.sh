#! /bin/bash
WORK_PATH='/usr/projects/vue-back'
echo $WORK_PATH
cd $WORK_PATH
echo '先清除旧代码'
git reset --hard origin/master
git clean -f

echo '拉取新代码'
git pull
echo '构建代码'
docker build -t vue-back:1.0 .
echo '停止旧容器并删除旧容器'
docker stop vue-back-container
docker rm -f vue-back-container
echo '启动新容器'
docker run -d -p 3000:3000 --name vue-back-container vue-back:1.0