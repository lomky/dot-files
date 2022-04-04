#!/usr/bin/env python3

import json
import urllib.request
from datetime import datetime


now = datetime.now().timestamp()
stored_data=open('/home/kat/.config/i3status/ip.txt', 'r')
last_updated=stored_data.readline()
ip=stored_data.readline()
stored_data.close()

# update hourly
if float(last_updated) + 300 < now:
    with urllib.request.urlopen("https://ipv4.geojs.io/v1/ip/geo.json") as url:
        data = json.loads(url.read().decode())
        ip = "✆" + data['ip'] + " (" + data['city'] + ", " + data['country_code'] + ")"
        stored_data=open('/home/kat/.config/i3status/ip.txt', 'w')
        stored_data.writelines([str(now) + "\n",ip])
        stored_data.close()

print(ip, end='')
