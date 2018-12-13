import json,urllib.request

from pythonosc import udp_client

# Set up port and server
ip, port = '127.0.0.1', 12000
client = udp_client.SimpleUDPClient(ip, port)

# get data from the URL and then call json.loads
# test if it returns a dictionary
# store the data
data = urllib.request.urlopen("http://fezz.in/whg/projects/data/tube-stops.json").read()
output = json.loads(data)
print(output)
keys =[]

# pull 'lat' and 'lon' from data and store them in loc
# test if it gets the right data
# send them to the client
for key in output.keys():
    lat = output[key]['lat']
    lon = output[key]['lon']
    loc = [lat,lon]
    print(loc)
    client.send_message("/lat", loc)
