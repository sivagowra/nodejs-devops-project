#!/bin/bash

STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:3000)

if [ $STATUS -eq 200 ]
then
 echo "Application is healthy"
else
 echo "Application is down"
fi