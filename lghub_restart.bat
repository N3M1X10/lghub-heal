@echo off
chcp 65001>nul

set file=lghub-path.txt
For /F "usebackq tokens=* delims=" %%i In ("%file%") Do Set path=%%i

taskkill /f /im "lghub.exe" /t
taskkill /f /im "lghub_agent.exe"
taskkill /f /im "lghub_updater.exe"
taskkill /f /im "lghub_system_tray.exe"
taskkill /f /im "lghub_crashpad_handler.exe"
taskkill /f /im "lghub_software_manager.exe"

rem sc pause "LGHUBUpdaterService"
rem net stop "LGHUBUpdaterService"
powershell Stop-Service -name LGHUBUpdaterService -force

>nul timeout /t 1 /nobreak

cd /d "%path%"
start "" "lghub.exe"

echo.
exit
