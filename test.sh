#!/bin/bash

URLS="
https://link.springer.com/article/10.1007/s00531-005-0479-y
http://journals.plos.org/plosone/article?id=10.1371/journal.pone.0190093
https://onlinelibrary.wiley.com/doi/abs/10.1111/j.1944-8287.2004.tb00230.x
https://academic.oup.com/neuro-oncology/article-abstract/20/suppl_2/i68/5000519?redirectedFrom=fulltext
https://www.nature.com/articles/s41467-018-04558-1
http://iopscience.iop.org/article/10.1088/0031-9155/50/9/014
http://dtb.bmj.com/content/16/2/5
https://www.sciencedirect.com/science/article/pii/S1053811917310236
"

for URL in $URLS
do
  curl -d "{\"url\":\"$URL\",\"sessionid\":\"abc123\"}" \
     --header "Content-Type: application/json" \
     http://127.0.0.1:8080/web \
     | jq .
#     | jq '.[].publicationTitle, .[].ISSN, .[].title'
done