#!/bin/sh

if [ -z "$KONG_API_HOST" ]
then
  KONG_API_HOST=192.168.99.100
fi
if [ -z "$KONG_API_PORT" ]
then
  KONG_API_PORT=8001
fi

#Wait until kong start
until $(curl -X GET --output /dev/null --silent --head --fail http://$KONG_API_HOST:$KONG_API_PORT); do
    printf '.'
    sleep 5
done

# Website
KONG_API_HOST=$KONG_API_HOST KONG_API_PORT=$KONG_API_PORT API_NAME=nginx API_UPSTREAM=http://nginx API_REQUEST_PATH=/ ./add-api-with-plugins.sh

#Consumers default client
KONG_API_HOST=$KONG_API_HOST KONG_API_PORT=$KONG_API_PORT USERNAME=default KEY=abcdefgh-ijkl-mnop-qrst-uvwxyz123456 ./add-consumer.sh

echo "done"
