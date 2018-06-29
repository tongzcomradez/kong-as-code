#!/bin/sh

if curl -s -o /dev/null -I -w "%{http_code}" -X GET http://$KONG_API_HOST:$KONG_API_PORT/consumers/$USERNAME | grep 200
then
  echo "user $USERNAME is already exist"
else
  curl -i -X POST \
    --url http://$KONG_API_HOST:$KONG_API_PORT/consumers/ \
    --data 'username='$USERNAME

  curl -i -X POST \
  --url http://$KONG_API_HOST:$KONG_API_PORT/consumers/$USERNAME/key-auth/ \
  --data 'key='$KEY
fi
