@echo off
chcp 65001
set locker=live.lock

del %locker%
taskkill /f /im ffmpeg.exe

echo streaming is stopped
echo 串流已經被終止
timeout 5