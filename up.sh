#!/bin/sh
syslog-ng && \
	/usr/sbin/named -f -u named ;
tail -f /var/log/messages