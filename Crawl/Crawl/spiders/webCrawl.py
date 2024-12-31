import scrapy
import json

class WebCrawl(scrapy.Spider):
    name = "web_crawl"

    def __init__(self, url=None, *args, **kwargs):
        super(WebCrawl, self).__init__(*args, **kwargs)
        self.start_urls = [url] if url else ["https://www.geeksforgeeks.org/implementing-web-scraping-python-scrapy/"]

    def parse(self, response):
        pass

    def parse_child(self, response, parent_url):
        pass

    def save_to_json(self):
        """Save the collected data to a json file."""
        with open("metadata.json", "w") as json_file:
            json.dump(self.data, json_file, indent=4)
