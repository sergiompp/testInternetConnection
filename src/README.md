## CODE

The code is the following:

```
@Echo off

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
```

Where:

•	***for /l %%i in (1,1,13) do ()***
> Instruction for a 13-step loop according to the decoding (start, step, end).

•	***ping XXX*** 
> This is the instruction that pings address XXX; in this case, www.google.com.

•	***if errorlevel 1 (set internet=Not connected to the Internet) else (set internet=Connected to the Internet)*** 
> It saves in the "Internet" variable if the connection has been made successfully or not. You can put the value you want since it is the text that will appear in the .txt file created at the end.

•	***if errorlevel 1 ( echo !date! !time! !internet! >> "disk:\route"\testping.txt )***
>It saves the echo with the format DATE - TIME - INTERNET variable in a file that it creates and is called "testping.txt"

•	***for /f "tokens=9 skip=9 delims= " %%a in ('ping google.com ') do (set average=%%a)***
> Runs the number of "tokens" in the ping and saves the average time it takes to do so in the "average" variable

•	***if "%average%" GEQ "60" (
 echo %date% %time% %internet% but average %average% >> "disk:\route"\testping.txt***
> It stores the information on the average times only if the value of the "average" variable exceeds 60 msec. Otherwise, it does nothing.
Also, the created .txt file is saved in the path "disk:\route"\XX".

•	***timeout /t 13 /nobreak***
> Syntax: timeout /t <timeoutinseconds> [/nobreak]
Pause the command processor for <timeoutinseconds> and ignore any key presses ([/nobreak]).

## LOG FILE

The .txt file created with the log is as can be seen in the following image:
  
![image](https://user-images.githubusercontent.com/27742980/230627524-62c281dc-53b1-40f1-becd-725f295da138.png)

In this case, the dates and times of the connections achieved to the target url are shown, as well as the average time taken.
