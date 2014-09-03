#Letenky
Displays discount flight tickets from Prague in sortable and filterable table. Tickets are fetched from akcniletenky.com.

##How it works
Basically it's just Makefile which fetches the data, filters relevant tickets and puts together HTML page.
Upload is done via [Dropbox Uploader by Andrea Fabrizi](https://github.com/andreafabrizi/Dropbox-Uploader)

##Usage
```
cd letenky
make
```

###Crontab job to run every hour
```
0 * * * * /path/to/letenky/build.sh
```
