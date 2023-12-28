#!/bin/bash

APPDIR=${APPDIR:-`pwd`}

source ${APPDIR}/tickers.sh

# Grab 60 days worth of 5m bars
export TRADE_PERIOD="60d"
export TRADE_INTERVAL="5m"

# Setup the filename
NOW=`date "+%y%m%d"`
#NOW=`date "+%y%m%d-%H%M%S"`
export PICKLE_FILENAME="yf-${NOW}.${TRADE_PERIOD}.${TRADE_INTERVAL}.pickle"

# Download and Pickle our trade data
${APPDIR}/pickle_my_tickers.py
