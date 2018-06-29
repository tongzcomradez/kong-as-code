FROM gliderlabs/alpine
RUN apk-install bash
RUN apk add --update curl && \
    rm -rf /var/cache/apk/*
    
ADD . /

RUN chmod 766 -R /*.sh

CMD ["sh", "/main.sh"]