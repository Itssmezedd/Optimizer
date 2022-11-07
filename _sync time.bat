:: by Itssmezedd

@echo off
goto :main

:main
rem RESYNC TIME
net start w32time
w32tm /resync
net stop w32time
exit
goto :eof
