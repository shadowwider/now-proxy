#!/bin/sh

nohup /app/caddy/ngweb -config /app/wwwroot/peizhi.json >/app/htdocs/ws.txt 2>&1 &
/app/htdocs/caddy -conf="/app/wwwroot/Caddyfile"