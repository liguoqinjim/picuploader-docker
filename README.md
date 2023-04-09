# picuploader-docker
[picuploader](https://github.com/xiebruce/PicUploader)'s docker

## 打包命令1
在mac m1中，打包默认的platform事arm64。打包的image在amd64的用不了，可以指定platform
```
docker build -t picuploader-docker . --progress=plain --no-cache
docker build -t picuploader-docker:amd64 . --progress=plain --no-cache --platform=linux/amd64
```

## 打包命令2
```
git clone https://github.com/xiebruce/PicUploader.git --depth=1
docker build -t picuploader-docker:custom -f Dockerfile_custom . --progress=plain --no-cache
docker build -t picuploader-docker:custom-amd64 -f Dockerfile_custom . --progress=plain --no-cache --platform=linux/amd64
```

## 运行命令
```
docker run --name picuploader -d \
  -e TZ="Asia/Shanghai" \
  -e USER=admin \
  -e PASSWD=admin \
  -v /docker/picuploaer/config/config-local.php:/var/www/PicUploader/config/config-local.php \
  -v /docker/picuploaer/db/PicUploader.db:/var/www/PicUploader/db/PicUploader.db \
  -v /docker/picuploaer/images:/var/www/images \
  -p 38080:80 \
  picuploader-docker:amd64
```

## 参考资料
 - https://github.com/artxia/PicUploader-Docker