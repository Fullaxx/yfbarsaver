# ------------------------------------------------------------------------------
# Pull base image
FROM ubuntu:jammy
MAINTAINER Brett Kuskie <fullaxx@gmail.com>

# ------------------------------------------------------------------------------
# Set environment variables
ENV APPDIR /app
ENV DEBIAN_FRONTEND noninteractive

# ------------------------------------------------------------------------------
# Install software and clean up
RUN apt-get update && \
	apt-get install -y --no-install-recommends python3-pip tzdata && \
	pip3 install yfinance && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/*

# ------------------------------------------------------------------------------
# Prepare the image
COPY app.sh tickers.sh download_*.sh pickle_my_tickers.py /app/

# ------------------------------------------------------------------------------
# Identify volumes
VOLUME /data

# ------------------------------------------------------------------------------
# Define default command
CMD ["/app/app.sh"]
