@echo off

taskkill /f /im "lghub.exe" /t
taskkill /f /im "lghub_agent.exe"
taskkill /f /im "lghub_updater.exe"
taskkill /f /im "lghub_system_tray.exe"
taskkill /f /im "lghub_crashpad_handler.exe"
taskkill /f /im "lghub_software_manager.exe"

net stop "LGHUBUpdaterService"
sc pause "LGHUBUpdaterService"

exit
