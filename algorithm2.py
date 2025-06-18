from bs4 import BeautifulSoup
import requests

file = open("url2.txt", "a", encoding="utf-8")

for i in range(1,5,1):
	page_to_scrape = requests.get("url2"+str(i))
	soup = BeautifulSoup(page_to_scrape.text, "html.parser")
	titles = soup.findAll("h3", {"class": "jeg_post_title"})
	for title in titles:
		file.write(title.text)