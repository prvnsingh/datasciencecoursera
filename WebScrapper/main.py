import threading
from queue import Queue

from spider import Spider
from domain import *
from utility import *

PROJECT_NAME = str(input('Enter the Project name : '))
#print(PROJECT_NAME)
HOMPAGE = str(input('Enter the Homepage : '))
#print(HOMPAGE)
DOMAIN_NAME = get_domain_name(HOMPAGE)
QUEUE_FILE = PROJECT_NAME + '/queue.txt'
CRAWLED_FILE = PROJECT_NAME + '/crawled.txt'
NUMBER_OF_THREADS = 8
queue = Queue() #thread queue
Spider(PROJECT_NAME,HOMPAGE,DOMAIN_NAME) #crawling the homepage

#create worker-spider thread 01
def create_workers():
	for _ in range(NUMBER_OF_THREADS):
		t = threading.Thread(target = work)
		t.daemon  = True
		t.start()

#do the job queue
def work():
	while True:
		url = queue.get()
		Spider.crawl_page(threading.current_thread().name,url)
		queue.task_done()


#Creating job - crawling each link
def create_jobs():
	for link in file_to_set(QUEUE_FILE):
		queue.put(link) 	#putting a link from queue.txt to thread queue for spider - workers
	queue.join()			#appending in the thread queue
	crawl()


#check if queue is empty, if not then crawl links in queue
def crawl():
	queued_links = file_to_set(QUEUE_FILE)
	if len(queued_links)>0:
		print(str(len(queued_links)) + ' links in the queue')
		create_jobs()

create_workers()
crawl()