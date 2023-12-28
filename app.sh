#!/bin/bash

APPDIR=${APPDIR:-`pwd`}

set -e

cd /data

${APPDIR}/download_1y_1d.sh
${APPDIR}/download_60d_5m.sh
${APPDIR}/download_7d_1m.sh
