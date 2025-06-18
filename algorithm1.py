from bs4 import BeautifulSoup
import requests

file = open("url1_titles.txt", "a", encoding="utf-8")

for i in range(1,5,1):
	page_to_scrape = requests.get("url1"+str(i))
	soup = BeautifulSoup(page_to_scrape.text, "html.parser")
	titles = soup.findAll("a", attrs={"rel":"bookmark"})
	for title in titles:
		file.write(title.text)
		file.write("\n")