FROM alpine:3

LABEL Rafael Arcanjo

RUN	apk add --no-cache bind syslog-ng && \
        mkdir -p /var/cache/bind/zones

COPY etc/* /etc/bind/
COPY zones/* /var/cache/bind/zones/

ADD up.sh /usr/bin/

EXPOSE 53

RUN chown -R named:named /var/cache/bind && chown named:named /etc/bind/rndc.key && \
	chmod u+x /usr/bin/up.sh

CMD up.sh