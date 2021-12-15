#!/usr/bin/python

import requests
import os.path

#path to polynews script

save_path = '/home/gabriel/.config/polybar/scripts'

#get your api key at https://newsapi.org/

api_key = "" #add you newsapi key

#find sources & country codes at https://newsapi.org/sources

sources = ""
country = ""

try:
    data = requests.get('https://newsapi.org/v2/top-headlines?apiKey='+api_key+'&sources='+sources+'&country='+country).json()

    sourceName = data['articles'][0]['source']['name']
    title = data['articles'][0]['title']
    url = data['articles'][0]['url']

    print(" "+sourceName+': '+title+" ")

    path = os.path.join(save_path,"current_url.txt")         
    f = open(path, "w")
    f.write(url)
    f.close()
    
 
except requests.exceptions.RequestException as e:
    print ('Algo deu errado!')

