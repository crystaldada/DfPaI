import requests
from lxml import etree
import time

# urls for data
urls = [
    'https://en.wikipedia.org/wiki/List_of_craters_on_the_Moon:_A%E2%80%93B',
    'https://en.wikipedia.org/wiki/List_of_craters_on_the_Moon:_C%E2%80%93F',
    'https://en.wikipedia.org/wiki/List_of_craters_on_the_Moon:_G%E2%80%93K',
    'https://en.wikipedia.org/wiki/List_of_craters_on_the_Moon:_O%E2%80%93Q',
    'https://en.wikipedia.org/wiki/List_of_craters_on_the_Moon:_R%E2%80%93S',
    'https://en.wikipedia.org/wiki/List_of_craters_on_the_Moon:_T%E2%80%93Z',
    'https://en.wikipedia.org/wiki/List_of_craters_on_the_Moon:_L%E2%80%93N'
]

parser = etree.HTMLParser()

# get the coordinates and diameters of mooncraters from the urls
def get_data(url):
    res = requests.get(url)

    tree = etree.fromstring(res.text, parser)
    coords = tree.xpath('//span[@class="geo"]/text()')
    diameters = tree.xpath('//tbody/tr/td[3]/text()')
    return coords,diameters

# make a list for coordinates as they should be in the form of group
#make another list for diameters
all_coords = []
all_diameters = []

# get data of coordinates from all the urls and add them into the lists
for url in urls:
    coords, diameters = get_data(url)
    all_coords += coords
    all_diameters += diameters
    #  ^ this is the same as all_coords.extend(coords)

# print the data in the list format
    print('added {} coords'.format(len(coords)))
    print('added {} diameters'.format(len(diameters)))

#print the size of the list
print('total of {} coords and {} diameters'.format(len(all_coords),len(all_diameters)))

i=0 # make a for loop
# write data into a csv file with three columns
with open('moon_crater_coords.csv', 'w') as f:
    f.write('lat,lon,diameters\n')
    for coord in all_coords:
        lat, lon = coord.split('; ')
        diameters = all_diameters[i]
        f.write('{},{},{}\n'.format(lat, lon, diameters))
        i+=1 #
