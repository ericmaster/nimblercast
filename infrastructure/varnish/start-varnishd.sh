#!/bin/bash
exec varnishd -j unix,user=varnishd -T 0.0.0.0:${VARNISH_ADMIN_PORT} -F -f /etc/varnish/default.vcl -S /etc/varnish/secret -s malloc,${VARNISH_MEMORY} -a 0.0.0.0:${VARNISH_PORT}
