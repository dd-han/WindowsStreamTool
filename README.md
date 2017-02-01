# Windows 上的 Nginx 串流工具

僅供個人備份用，看得懂就拿去用，看不懂我也不會說明

如果需要專業實況，請聯絡 FB 粉專 (可以教我玩音樂遊戲嗎？)[https://www.facebook.com/JiaoMaChannel] 或是 (音樂遊戲實況屋 -ABC Project-)[https://www.facebook.com/DJABCchannel] ，也可以搜尋我們的 YouTube 頻道，裡面有過往的實況錄影，可供您參考。


## 使用注意事項：

僅供備忘

1. 修改 `03.推上 Twitch.cmd` 
2. 把 nginx.cmd 放到有 PATH 裡面
3. 務必先把 cmd.exe 的預設自體改成 `Consolas` 或是 `Lucida Console` ，否則預設 UTF-8 的 cmd.exe 會吃點震字，點陣字沒有中文所以訊息會被吃掉。
4. 執行 `01.啟動本機串流伺服器.cmd` 把 `Nginx` 中繼影情啟動
5. 開啟 OBS 或是其他實況軟體，把訊號打到 `rtmp://localhost/live` ，金鑰設定為 `obs-stream`
6. 執行 `03.推上 Twitch.cmd` 將訊號重新編碼並轉發至 Twitch
7. 串流結束後，執行 `04.停止推上 Twitch.cmd` 結束串流
