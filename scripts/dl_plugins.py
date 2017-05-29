#
# Python3 script to download plugins.
#

from urllib.request import urlopen
from urllib.parse import urlparse

URLS = (
	('ScyllaHide', '2017.3.3', 'https://github.com/x64dbg/ScyllaHide/releases/download/snapshot/ScyllaHide_2017-03-03_15-29.7z'),
	('SwissArmyKnife', '2016.10.11', 'https://github.com/Nukem9/SwissArmyKnife/releases/download/3/Release-10-11-2016.zip'),
	('TitanHide', '0.0.1.4', 'https://github.com/mrexodia/TitanHide/releases/download/V0014/TitanHide_archive.rar'),
)

def get_ext(url):
	fname = url.split('/')[-1]
	return fname.partition('.')[2]

def main():
	for (name, version, url) in URLS:
		print('Downloading: %s v%s: %s' % (name, version, url))
		res = urlopen(url)
		data = res.read()
		ext = get_ext(url)
		fname = 'files/plugins/%s.%s' % (name, ext)
		print('Writing file:', fname)
		with open(fname, 'wb') as file:
			file.write(data)

if __name__ == '__main__':
	main()
