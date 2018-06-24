# zotero-translation-server

[Zotero translation server](https://github.com/zotero/translation-server) with a cache included.

Docker is used to link the cache service (nginx is used) and the zotero translation service.

## Usage

```shell
docker-compose up
```

Then you can run query this way (replace 8080 by 1969 if you do not want the cache):

```shell
curl -d '{"url":"http://journals.plos.org/plosone/article?id=10.1371/journal.pone.0190093","sessionid":"abc123"}' \
     --header "Content-Type: application/json" \
     http://127.0.0.1:8080/web \
     | jq .
```

## Developers

You can build your own zotero/translation-server docker image:

```shell
git clone --recurse-submodules git@github.com:zotero/translation-server.git
docker-compose -f ./docker-compose.debug.yml build
```

Then run it:

```shell
docker-compose -f ./docker-compose.debug.yml up
```

This will build and run a fresh zotero/translation-server docker image. It could be interesting to get the latest fixes. For example sciencedirect translator is not working with the latest official docker image today (2018/06/24) but it works when building our own zotero/translation-server docker image (included the latest git changes).

Then run this script to test translation of few URLs:

```shell
./test.sh
```
