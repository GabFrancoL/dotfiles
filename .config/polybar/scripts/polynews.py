#!/usr/bin/python

import requests
import os.path

#path to polynews script

save_path = '/home/gabriel/.config/polybar/scripts'

#get your api key at https://newsapi.org/

api_key = "ba7dce33a2ee4772b7b9162a6c0b6110"

#find sources & country codes at https://newsapi.org/sources

sources = "info-money"
country = ""

try:
    data = requests.get('https://newsapi.org/v2/top-headlines?apiKey='+api_key+'&sources='+sources+'&country='+country).json()

    sourceName = data['articles'][0]['source']['name']
    title = data['articles'][0]['title']
    url = data['articles'][0]['url']

    print(' '+sourceName+': '+title+' ')

    path = os.path.join(save_path,"current_url.txt")         
    f = open(path, "w")
    f.write(url)
    f.close()
                                         
except requests.exceptions.RequestException as e:
    print (' Algo deu errado! ')
