# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the current directory contents into the container
COPY . .

# Install Scrapy and any other dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Install any system dependencies for Scrapy (if required)
RUN apt-get update && apt-get install -y \
    libssl-dev \
    libffi-dev \
    python3-dev \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Expose the port Scrapy might use (optional)
EXPOSE 8080

# Set the default command to run the Scrapy spider (replace 'my_spider' with your spider's name)
CMD ["scrapy", "crawl", "web_crawl"]
