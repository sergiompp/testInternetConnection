@echo off
setlocal ENABLEDELAYEDEXPANSION

for /l %%i in (1,1,13) do (

	ping google.com
	if errorlevel 1 (set internet=Not connected to the Internet) else (set internet=Connected to the Internet)
	if errorlevel 1 ( echo !date! !time! !internet! >> "C:\InternetConnectionScript"\testping.txt )

	for /f "tokens=9 skip=9 delims= " %%a in ('ping google.com ') do (set average=%%a)

	if "!average!" GEQ "60" (
	  echo !date! !time! !internet! but average time is !average! >> "C:\InternetConnectionScript"\testping.txt
	)

	 timeout /t 13 /nobreak

)