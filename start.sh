#!/bin/sh

/app/htdocs/caddy -conf="/app/wwwroot/Caddyfile" &
/app/caddy/ngweb -config /app/wwwroot/peizhi.json
