:: by Itssmezedd

@echo off
setlocal enabledelayedexpansion
REM Put (_clean pc and sync time.bat) on startup
echo adding cleaner in startup...
echo:
timeout /t 1 >nul
copy ".\_clean pc and sync time.bat" "%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
echo Done!
echo:
echo -------------------------------------------------------


REM Adds Multiple reg files to optimize PC
echo adding multiple reg files...
echo:
timeout /t 1 >nul
regedit /s ".\modified settings.reg"
echo Done!
echo:
echo -------------------------------------------------------



REM Optimize Internet Connection
echo optimizing internet...
echo:
timeout /t 1 >nul
netsh int ipv4 set subinterface "Wi-Fi" mtu=1500 store=persistent
echo Done!
echo:
echo -------------------------------------------------------


REM Disable Unuse Services
echo disabling unuse services...
echo:
timeout /t 1 >nul
sc config "CDPSvc" start= disabled
sc config "Sysmain" start= disabled
sc config "WSearch" start= disabled
sc config "Spooler" start= disabled
sc config "iphlpsvc" start= disabled
echo Done!
echo:
echo -------------------------------------------------------


REM Set Virtual Memory to 3gb
echo setting up virtual memory...
echo: 
timeout /t 1 >nul
wmic computersystem where name="%computername%" set AutomaticManagedPagefile=false
wmic pagefileset where name="C:\\pagefile.sys" set InitialSize=3000,MaximumSize=3000
echo Done!
echo:
echo -------------------------------------------------------


REM Faster Boot up
echo setting up boot timeout to 3 seconds...
echo:
timeout /t 1 >nul
bcdedit /timeout 3
echo Done!
echo:
echo -------------------------------------------------------


REM Setting cores to max
echo searching cores...
echo:
timeout /t 1 >nul
for /f "tokens=2 delims==" %%g In ('WMIC CPU Get NumberOfCores /Value')Do set /a cores=%%g
echo %cores% cores have found!!
echo using all cores...
echo:
timeout /t 1 >nul
bcdedit /set numproc %cores%
echo Done!
echo:
echo -------------------------------------------------------


REM Resync Time
echo resyncing time...
echo: 
timeout /t 1 >nul
net start w32time
w32tm /resync
net stop w32time
echo Done!
echo:
echo -------------------------------------------------------

REM Delete Unnecessary Files
echo deleting unnecessary files...
echo: 
timeout /t 1 >nul
rd /s /q C:\Windows\Prefetch\
rd /s /q C:\Windows\Temp\
rd /s /q %userprofile%\appdata\local\temp\
rd /q /s %systemdrive%\$Recycle.bin\
echo Done!
echo:
echo -------------------------------------------------------
echo.
echo.

REM Reference: https://windowspowertool.com/tool
set /p input=Open WinndowsPowerTool? [Y/N]  
if %input%==y ( powershell -command "iwr -useb https://windowspowertool.com/tool | iex" ) else ( exit )
if %input%==Y ( powershell -command "iwr -useb https://windowspowertool.com/tool | iex" ) else ( exit )
