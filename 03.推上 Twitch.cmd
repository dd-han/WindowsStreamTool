@echo off
chcp 65001

@echo off
set rtmpSrc=rtmp://localhost/live/obs-stream

rem ==== setup server here ====
rem full twitch server here:
rem https://github.com/jp9000/OBS/blob/master/rundir/services.xconfig
set rtmpDest=rtmp://live-tyo.twitch.tv/app

rem ==== setup stream key here ====
set rtmpDestKey=live_key_here

set rtmpDestFull=%rtmpDest%/%rtmpDestKey%

set encodingParam=-vcodec libx264 -preset medium -x264opts nal-hrd=cbr:force-cfr=1:keyint=60 -b:v 2500k -maxrate 3000k -bufsize 6000k -s 1280x720 -sws_flags lanczos -acodec copy
set locker=live.lock

title 串流轉發中...

echo '' > %locker%

set ERROR_LOG_FILE=%USERPROFILE%\watchdog.log

:looping
date /T >> %ERROR_LOG_FILE%
time /T >> %ERROR_LOG_FILE%

echo starting server >> %ERROR_LOG_FILE%
echo 準備連線
timeout 3
ffmpeg -i %rtmpSrc% %encodingParam% -f flv %rtmpDestFull%
echo 串流似乎斷線了
rem timeout 10
if EXIST %locker% goto looping

echo 串流結束。