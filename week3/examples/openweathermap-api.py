"""
Get the weather somewhere using the OpenWeatherMap API.

Make sure you put your own API token below!
"""

import requests
import json

# url = 'http://api.openweathermap.org/data/2.5/weather'
url = 'http://fezz.in/whg/projects/data/tube-stops.json'

# place = input()

# params = {
#     'q': place,
#     'APPID': '!!! put your own token here !!!',
# }

# response = requests.get(url, params=params)
response = requests.get(url)

data = json.loads(response.text)


# this is the same as the line above
#data = response.json()

# temp = data["main"]["temp"] - 273
# print('temp in {} is {}'.format(place, temp))
# print(data)



# open and save data into a json file
# with open('data.csv', 'w') as f:
#     f.write('lat,lon\n')
#     for coord in all_coords:
#         lat, lon = coord.split('; ')
#         f.write('{},{}\n'.format(lat, lon))


#  osc client
from pythonosc import udp_client

# ip, port = '172.20.10.11', 5000
ip, port = '127.0.0.1', 2345
client = udp_client.SimpleUDPClient(ip, port)

# msg = input()

print('The temperature in ' + data['name'] + ' is ' + str(temp))


client.send_message("location/", loc)
print('this stop is {} {}'.format(data['lat'], ['lon']))
