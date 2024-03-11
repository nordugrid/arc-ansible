#!/bin/bash
curl -s http://builds.nordugrid.org/nightlies/nordugrid-arc/{{ arc_branch }}/ | sed -n 's/^.*<a.*>\(.*\)\/<\/a>.*$/\1/p' | sort  | tail -1 > /etc/yum/vars/arcnightly
