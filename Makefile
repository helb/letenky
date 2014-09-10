all:
	rm -f index.html letenky data date data.rss letenky.rss
	wget "http://www.akcniletenky.com/" -O letenky
	wget "http://feeds.feedburner.com/akcniletenky?format=xml" -O letenky.rss
	dos2unix letenky*
	enconv -L czech -x UTF-8 letenky*
	sed ':begin;$!N;s/\([0-9]\ *\)\n/\1/;tbegin;P;D' letenky | grep 'Praha - ' | tail -n +2 | sed -e 's/.*•\ <a\ /<tr><td><a\ /; s/<\/a>\ -\ /<\/a><\/td><td>/; s/\ Kč.*/<\/td><\/tr>/; s/\&/\&amp\;/g; s/\([0-9]\)[[:space:]]\([0-9]\)/\1\2/g;' | grep '<a\ ' | sed 's/\([0-9]\)[[:space:]]*/\1/g' > data
	date +"%-d.%-m.%Y %H:%M" > date
	cat head predata data prefoot date foot > index.html
	grep Kč letenky.rss | sed 's/title>//g; s/<\/*//g; s/^[[:space:]]*//g; s/\ Kč/<\/td>/; s/\([0-9]\)[[:space:]]\([0-9]\)/\1\2/g; s/^/<tr><td>/; s/:\ /<\/td><td>/; s/\ -\ \([0-9]\)/<\/td><td>\1/;' > data.rss
	cat head predata.rss data.rss prefoot date foot > rss.html
	sed -i 's/\ z\ Prahy//' rss.html
	/home/helb/bin/dropbox_uploader upload ~/weby/letenky/index.html ~/weby/letenky/rss.html Public/letenky/
