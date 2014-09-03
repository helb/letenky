all:
	rm index.html letenky data
	wget "http://www.akcniletenky.com/" -O letenky
	enconv -L czech -x UTF-8 letenky
	grep 'Praha - ' letenky | tail -n +2 | sed 's/.*\<a\ /<tr><td><a\ /;s/<\/a>\ -\ /<\/a><\/td><td>/;s/Kč.*/Kč<\/td><\/tr>/' | grep '<a\ ' > data
	cat head data foot > index.html

nowget:
	rm index.html
	cat head data foot > index.html
