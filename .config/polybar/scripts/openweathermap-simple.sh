#!/bin/sh

get_icon() {
    case $1 in
        # Icons for weather-icons
        #01d) icon="";;
        #01n) icon="";;
        #02d) icon="";;
        #02n) icon="";;
        #03*) icon="";;
        #04*) icon="";;
        #09d) icon="";;
        #09n) icon="";;
        #10d) icon="";;
        #10n) icon="";;
        #11d) icon="";;
        #11n) icon="";;
        #13d) icon="";;
        #13n) icon="";;
        #50d) icon="";;
        #50n) icon="";;
        #*) icon="";

        # Icons for Font Awesome 5 Pro
        01d) icon="";; # Clear sky day
        01n) icon="";; # Clear sky night
        02d) icon="";; # Few cloud day
        02n) icon="";; # Few cloud night
        03*) icon="";; # Scaterred clouds
        04*) icon="";; # Broken clouds
        09*) icon="";; # Shower rain
        10d) icon="";; # Heavy rain day
        10n) icon="";; # Heavy rain night
        11*) icon="";; # Thunderstorm
        13*) icon="";; # Snow
        50*) icon="";; # Fog
        *) icon="";    # ?
    esac

    echo $icon
}

KEY="" #add your openweather api key
CITY="" #add your city followed by country
UNITS="metric"
SYMBOL="°C"

API="https://api.openweathermap.org/data/2.5"

if [ -n "$CITY" ]; then
    if [ "$CITY" -eq "$CITY" ] 2>/dev/null; then
        CITY_PARAM="id=$CITY"
    else
        CITY_PARAM="q=$CITY"
    fi

    weather=$(curl -sf "$API/weather?appid=$KEY&$CITY_PARAM&units=$UNITS")
else
    location=$(curl -sf https://location.services.mozilla.com/v1/geolocate?key=geoclue)

    if [ -n "$location" ]; then
        location_lat="$(echo "$location" | jq '.location.lat')"
        location_lon="$(echo "$location" | jq '.location.lng')"

        weather=$(curl -sf "$API/weather?appid=$KEY&lat=$location_lat&lon=$location_lon&units=$UNITS")
    fi
fi

if [ -n "$weather" ]; then
    weather_temp=$(echo "$weather" | jq ".main.temp" | cut -d "." -f 1)
    weather_icon=$(echo "$weather" | jq -r ".weather[0].icon")

    echo " $(get_icon "$weather_icon")" "$weather_temp$SYMBOL"
fi
