#!/bin/bash

#check for a directory called "getopinion"; create it if it doesn't exist, then cd to it
if [ -d "/var/www/news/times-news" ]; then
	cd /var/www/news/times-news
else
	mkdir /var/www/news/times-news
	cd /var/www/news/times-news
fi

#dl the times-news opinion page
wget http://times-news.com/opinion/index.html

#delete all but div id="headline_list"
sed -n '/<dl id="headline_list">/,/<\/dl>/p' index.html > $(date +%F).opinionsection.html

#isolate lines that contain "<a href=" i.e. links; save to new file
grep '<a href=' $(date +%F).opinionsection.html > $(date +%F).opinionlinks.html

#strip all html from urls recovered in last step
sed -i -r 's/.*<a href=\"(.*)\".*/\1/' $(date +%F).opinionlinks.html

#remove first line (replaced with uniq)
#sed -i 1d $(date +%F).opinionlinks.html

#remove last line
sed -i -e '$d' $(date +%F).opinionlinks.html

#remove duplicate lines
uniq $(date +%F).opinionlinks.html > $(date +%F).opinionlinks.temp.html
mv $(date +%F).opinionlinks.temp.html $(date +%F).opinionlinks.html

#clean up
rm index.html
rm $(date +%F).opinionsection.html
mv $(date +%F).opinionlinks.html $(date +%F).opinionurls.txt


