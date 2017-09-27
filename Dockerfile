FROM alpine
RUN apk update
RUN apk add redis
WORKDIR /data
EXPOSE 6379
CMD redis-server --protected-mode no