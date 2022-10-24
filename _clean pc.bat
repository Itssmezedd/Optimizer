:: by Itssmezedd

@echo off
goto :main

:main
rem CLEAN PC:
rd /s /q C:\Windows\Prefetch\
rd /s /q C:\Windows\Temp\
rd /s /q %userprofile%\appdata\local\temp\
rd /q /s %systemdrive%\$Recycle.bin\
exit
goto :eof
