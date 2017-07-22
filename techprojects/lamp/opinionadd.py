#!/usr/bin/python

import MySQLdb
import datetime

today=str(datetime.date.today())
filename="/var/www/news/times-news/"+today+".opinionurls.txt"

f = open(filename, 'r')
urls=str(f.read())

conn = MySQLdb.connect (host = "localhost",user = "ctnopinion",passwd = "uwJ86ZxWuVAN6q6K",db = "ctnopinion")

cursor = conn.cursor()

cursor.execute("""INSERT INTO opinionurls VALUES(NULL,CURDATE(),%s)""", (urls))

conn.commit()
