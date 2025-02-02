@echo off
chcp 65001>nul

:: LGHUB Path
set path=C:\Program Files\LGHUB\

taskkill /f /im "lghub.exe" /t
taskkill /f /im "lghub_agent.exe" /t
taskkill /f /im "lghub_updater.exe" /t
taskkill /f /im "lghub_system_tray.exe"
taskkill /f /im "lghub_crashpad_handler.exe"
taskkill /f /im "lghub_software_manager.exe"
powershell Stop-Service -name LGHUBUpdaterService -force
>nul timeout /t 1 /nobreak

::start
cd /d "%path%"
start "" "lghub.exe"
exit
