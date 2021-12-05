@echo off
del /f "C:\Users\Public\Desktop\Epic Games Launcher.lnk" > out.txt 2>&1
net config server /srvcomment:"Windows Server 2019 By Ewing35" > out.txt 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /V EnableAutoTray /T REG_DWORD /D 0 /F > out.txt 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /f /v Wallpaper /t REG_SZ /d D:\a\wallpaper.bat
net user administrator @ewingvds /add >nul
net localgroup administrators administrator /add >nul
net user administrator /active:yes >nul
net user installer /delete
diskperf -Y >nul
sc config Audiosrv start= auto >nul
sc start audiosrv >nul
ICACLS C:\Windows\Temp /grant administrator:F >nul
ICACLS C:\Windows\installer /grant administrator:F >nul
echo  Successfully Installed !, If the RDP is Dead, Please Rebuild Again! 
echo IP:
tasklist | find /i "ngrok.exe" >Nul && curl -s localhost:4040/api/tunnels | jq -r .tunnels[0].public_url || echo "Ngrok tuneli alınamıyor, Ngrok_AUTH_TOKEN için Ayarlar> Sırlar> Depo sırrı. Belki önceki sanal makineniz hala çalışıyordur: https://dashboard.ngrok.com/status/tunnels"
echo Username: administrator
echo Password: @ewingvds
echo .
echo  Bu vds Ewing Tarafindan Yapilmistir
echo   Lütfen RDP'nize Giris Yapin!
ping -n 10 127.0.0.1 >nul
