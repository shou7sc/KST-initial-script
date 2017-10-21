#!/bin/bash

################################
#
# TOP CPU INFO 
#
#################################

top d1 -c -b -d 1 -n 120 > /root/analysis/cpu-info/02-bench-log/top-cpu-info.log.`date '+%m%d-%H%M'` &
top d1 -c -b -d 1
