#  osc client
from pythonosc import udp_client

# ip, port = '172.20.10.11', 5000
ip, port = '127.0.0.1', 2345

client = udp_client.SimpleUDPClient(ip, port)

msg = input()
client.send_message("/position", msg)
print('sent {} to {}'.format(msg, ip))

client.send_message("/temp", 20)
