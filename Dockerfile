FROM alpine
ENV redis redis-4.0.6
RUN apk update && \
	apk add make build-base linux-headers && \
	wget http://download.redis.io/releases/${redis}.tar.gz && \
	tar xzf ${redis}.tar.gz && \
	cd ${redis}/ && \
	make distclean && make && mv src/redis-server /usr/bin/ && mv src/redis-cli /usr/bin/ && \
	cd .. && rm -Rf ${redis}/ && rm ${redis}.tar.gz && \
	apk del build-base make linux-headers && rm -rf /var/cache/apk/*
CMD redis-server --protected-mode no
