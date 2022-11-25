@echo off
rem: Note %~dp0 get path of this batch file
rem: Need to change drive if My Documents is on a drive other than C:
set driverLetter=%~dp0
set driverLetter=%driverLetter:~0,2%
%driverLetter%
cd %~dp0
rem: the two line below are needed to fix path issues with incorrect slashes before the bin file name
set str=%1
set str=%str:/=\%

rem: Using the open source texane-stlink instead of the proprietary STM stlink exe
C:/Program Files/STMicroelectronics/STM32Cube/STM32CubeProgrammer/bin/STM32_Programmer_CLI.exe -c port="SWD" "mode=UR" "yes -e all" -q -d %str% 0x8000000 -g
