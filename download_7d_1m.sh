#!/bin/bash

APPDIR=${APPDIR:-`pwd`}

source ${APPDIR}/tickers.sh

# Grab 7 days worth of 1m bars
export TRADE_PERIOD="7d"
export TRADE_INTERVAL="1m"

# Setup the filename
NOW=`date "+%y%m%d"`
#NOW=`date "+%y%m%d-%H%M%S"`
export PICKLE_FILENAME="yf-${NOW}.${TRADE_PERIOD}.${TRADE_INTERVAL}.pickle"

# Download and Pickle our trade data
${APPDIR}/pickle_my_tickers.py
xz ${PICKLE_FILENAME}
