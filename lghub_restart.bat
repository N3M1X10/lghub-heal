@echo off
chcp 65001 >nul

set file=lghub-path.txt
For /F "usebackq tokens=* delims=" %%i In ("%file%") Do Set path=%%i


rem taskkill /f /im ""
taskkill /f /im "lghub.exe"
taskkill /f /im "lghub_agent.exe"
taskkill /f /im "lghub_updater.exe"
taskkill /f /im "lghub_system_tray.exe"
taskkill /f /im "lghub_crashpad_handler.exe"
taskkill /f /im "lghub_software_manager.exe"

sc pause "LGHUBUpdaterService"
net stop "LGHUBUpdaterService"


start "%path%" "%path%lghub.exe"

echo.
exit /b
