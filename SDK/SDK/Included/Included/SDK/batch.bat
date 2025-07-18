@echo off
color 0c
mode con: cols=70 lines=50
SETLOCAL EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #`$H#$`E# & echo on & for %%b in (1) do     rem"') do (
  set "DEL=%%a"
)

echo. 
call :colorEcho 90 "CHECK SERIALS"
echo.
echo. 
echo --------- HDD ---------- 
wmic diskdrive get serialnumber
echo --------- CPU ----------  
wmic memorychip get serialnumber
echo --------- MOBO --------- 
wmic baseboard get serialnumber
echo ------------------------

echo. 
call :colorEcho 90 "CHECK MAC ADDRESS"
echo. 
echo. 
wmic path Win32_NetworkAdapter get name, MacAddress

echo ------------------------ 
echo. 
call :colorEcho 20 "IPv4 ADDRESS"
echo.
ipconfig /all | findstr /r /c:"IPv4"
echo. 
call :colorEcho 20 "Public IP Address"
echo.
curl ip-adresim.app
echo.
echo.

pause
exit

:colorEcho
echo off
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1i