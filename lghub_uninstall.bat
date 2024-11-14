@echo off
chcp 65001 >nul

rem taskkill /f /im ""
taskkill /f /im "lghub.exe"
taskkill /f /im "lghub_agent.exe"
taskkill /f /im "lghub_updater.exe"
taskkill /f /im "lghub_system_tray.exe"
taskkill /f /im "lghub_crashpad_handler.exe"
taskkill /f /im "lghub_software_manager.exe"

taskkill /f /im "lghub_installer.exe"

timeout /t 1 >nul

net stop "LGHUBUpdaterService"
sc pause "LGHUBUpdaterService"

timeout /t 1 >nul

start "" "lghub_installer.exe" ^
--language="ru_RU" ^
--log ^
--save_settings ^
--saveSettings ^
--skip_copy ^
--skipCopy ^
--uninstall ^
--uninstall_temp ^
--uninstallTemp ^
--silent


echo.
exit /b
