@echo off
set NGINX_PATH=%~dp0..\nginx

cd /d %NGINX_PATH%
if '%1'=='start' (
  IF EXIST logs\nginx.pid (
    echo nginx already started, please stop first
  ) ELSE (
    echo nginx will start at background
    start nginx.exe
    echo OK
  ) 

) ELSE IF '%1'=='start-fg' (
  IF EXIST logs\nginx.pid (
    echo nginx already started, please stop first
  ) ELSE (
    echo nginx will start at forgeground
    nginx.exe
  ) 
) ELSE IF '%1'=='stop' (
  IF EXIST logs\nginx.pid (
    echo normally stop nginx
    nginx.exe -s stop
  ) ELSE (
    echo force stop nginx
    taskkill /f /im nginx.exe
  ) 
  
) ELSE IF '%1'=='reload' (
  IF EXIST logs\nginx.pid (
    echo reloading nginx
    nginx.exe -s reload
  ) ELSE (
    echo no nginx to reload!!
    timeout 5
    exit 1
  ) 
) ELSE (
  nginx %*
)
timeout 5