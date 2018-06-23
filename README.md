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
