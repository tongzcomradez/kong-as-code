#!/bin/sh

curl -i -X POST \
  --url http://$KONG_API_HOST:$KONG_API_PORT/apis/$API_NAME/plugins/ \
  --data 'name=key-auth' \
  --data 'config.key_names=API_KEY'

curl -i -X POST \
  --url http://$KONG_API_HOST:$KONG_API_PORT/apis/$API_NAME/plugins/ \
  --data 'name=cors'
