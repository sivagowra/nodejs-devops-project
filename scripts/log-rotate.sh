#!/bin/bash

LOG_DIR="/var/log/nodeapp"

tar -czf logs_$(date +%F).tar.gz $LOG_DIR

rm -rf $LOG_DIR/*.log