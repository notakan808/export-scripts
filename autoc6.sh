#!/bin/bash

cp node_exporter.service /etc/rc.d/init.d/node_exporter
service node_exporter start
