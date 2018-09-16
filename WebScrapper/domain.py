from urllib.parse import urlparse

#get domain name
def get_domain_name(url):
	try:
		results = get_sub_domain_name(url).split('.')
		return results[-2] + '.' + results[-1]  #second last and last
	except:
		return ''


# get sub domain name
def get_sub_domain_name(url):
	try:
		return urlparse(url).netloc  #function to return sub domain name
	except:
		return ''