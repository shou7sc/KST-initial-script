#!/bin/bash
$nginxinitial='log_format ltsv "time:$time_local"
                "\thost:$remote_addr" 
                "\tforwardedfor:$http_x_forwarded_for"
                "\treq:$request"
                "\tstatus:$status"
                "\tmethod:$request_method"
                "\turi:$request_uri"
                "\tsize:$body_bytes_sent"
                "\treferer:$http_referer"
                "\tua:$http_user_agent"
                "\treqtime:$request_time"
                "\tcache:$upstream_http_x_cache"
                "\truntime:$upstream_http_x_runtime"
                "\tapptime:$upstream_response_time"
                "\tvhost:$host"; 
    access_log  /var/log/nginx/access-log  ltsv;'
echo "$nginxinitial"