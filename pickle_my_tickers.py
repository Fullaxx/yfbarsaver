#!/usr/bin/env python3
# pip3 install yfinance

import os
import sys
import yfinance as yf
#from datetime import datetime

def bailmsg(*args, **kwargs):
	print(*args, file=sys.stderr, **kwargs)
	exit(1)

def download_ticker_data(interval, filename):
	print('Downloading and saving ' + filename + ' ...')
	symbols = os.getenv('TRADE_SYMBOLS')
	period = os.getenv('TRADE_PERIOD')
	start = os.getenv('START_DATE')
	end = os.getenv('END_DATE')
	if (period is not None):
		data = yf.download(symbols, period=period, interval=interval, group_by='ticker')
	elif ((start is not None) and (end is not None)):
		data = yf.download(symbols, start=start, end=end, interval=interval, group_by='ticker')
	else:
		bailmsg('Set TRADE_PERIOD or (START_DATE and END_DATE)')
	data.to_pickle(filename)

if __name__ == '__main__':
	if os.getenv('TRADE_SYMBOLS') is None: bailmsg('Set TRADE_SYMBOLS')
	interval = os.getenv('TRADE_INTERVAL')
	if interval is None: bailmsg('Set TRADE_INTERVAL')
	filename = os.getenv('PICKLE_FILENAME')
	if filename is None: bailmsg('Set PICKLE_FILENAME')

#	timestamp = datetime.now()
#	datestamp = timestamp.strftime('%Y%m%d-%H%M%S')
#	datestamp = timestamp.strftime('%Y%m%d')
#	datestamp = 'latest'
#	filename = 'yf-' + datestamp + '.' + period + '.' + interval + '.pickle'
	if os.path.isfile(filename):
		print('Found ' + filename + ' (Will not download)')
	else:
		download_ticker_data(interval, filename)
