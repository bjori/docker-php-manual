# Building PHP manual with Docker container ==

## Preparation


```
sudo docker pull jgsqware/svn-client
sudo docker build -t jeanseb/php-manual-tools
```
## Getting the source

cf http://doc.php.net/tutorial/local-setup.php

```
mkdir -p ~/workspace/phpdoc
cd ~/workspace/phpdoc
sudo docker run -it --rm -v $PWD:/src jgsqware/svn-client co http://svn.php.net/repository/phpdoc/modules/doc-fr doc-fr
```

## Building the source
```
cd /workspace/phpdoc/doc-fr
sudo docker run -it --rm -v $PWD:/app jeanseb/php-manual-tools php doc-base/configure.php
sudo docker run -it --rm -v $PWD:/app jeanseb/php-manual-tools phd -d /app/doc-base/.manual.xml
```

## Browsing

```
docker run -v ~/workspace/phpdoc/doc-fr/output:/usr/share/nginx/html:ro -d -p 8080:80 nginx:latest
```

=> http://localhost:8080/big-xhtml.html
=> http://localhost:8080/chunked-xhtml/

