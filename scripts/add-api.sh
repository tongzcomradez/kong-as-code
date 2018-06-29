#!/bin/sh

if curl -s -o /dev/null -I -w "%{http_code}" -X GET http://$KONG_API_HOST:$KONG_API_PORT/apis/$API_NAME | grep 200
then
  echo "api $API_NAME is already exist"
else
  #add api
  curl -s -i -X POST \
    --url http://$KONG_API_HOST:$KONG_API_PORT/apis/ \
    --data 'name='$API_NAME \
    --data 'upstream_url='$API_UPSTREAM \
    --data 'request_path='$API_REQUEST_PATH \
    --data 'strip_request_path=true'
fi
