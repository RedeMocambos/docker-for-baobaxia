#!/bin/bash

if [ -f /usr/bin/supervisord ] ; then
  service supervisor restart
fi

if [ -f /usr/sbin/nginx ] ; then
  service nginx restart
fi
