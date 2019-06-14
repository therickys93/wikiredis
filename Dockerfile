FROM alpine
RUN apk update && apk add redis
RUN mkdir data
CMD cd /data && redis-server --protected-mode no
