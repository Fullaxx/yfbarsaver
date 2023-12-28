#!/bin/bash

APPDIR=${APPDIR:-`pwd`}

source ${APPDIR}/tickers.sh

# Grab 1y worth of daily bars
export TRADE_PERIOD="1y"
export TRADE_INTERVAL="1d"

# Setup the filename
NOW=`date "+%y%m%d"`
#NOW=`date "+%y%m%d-%H%M%S"`
export PICKLE_FILENAME="yf-${NOW}.${TRADE_PERIOD}.${TRADE_INTERVAL}.pickle"

# Download and Pickle our trade data
${APPDIR}/pickle_my_tickers.py
