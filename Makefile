all:
	rm -f index.html letenky data date
	wget "http://www.akcniletenky.com/" -O letenky
	enconv -L czech -x UTF-8 letenky
	grep 'Praha - ' letenky | tail -n +2 | sed 's/.*\<a\ /<tr><td><a\ /;s/<\/a>\ -\ /<\/a><\/td><td>/;s/\ Kč.*/<\/td><\/tr>/;s/\&/\&amp\;/g' | sed 's/\([0-9]\) \([0-9]\)/\1\2/g' | grep '<a\ ' > data
	date +"%-d.%-m.%Y %H:%M" > date
	cat head data prefoot date foot > index.html
	/home/helb/bin/dropbox_uploader upload ~/weby/letenky/index.html Public/letenky/

nowget:
	rm -f index.html
	cat head data prefoot date foot > index.html
