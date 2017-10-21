#!/bin/bash

dstat -tfv --top-io --top-bio --top-latency --top-latency-avg --file --lock --tcp --output /root/analysis/dstat/02-dstat-res-analysis/dstat-bench.log.`date '+%m%d-%H%M'` 
