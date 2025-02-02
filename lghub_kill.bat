@echo off
title lghub_kill
set "arg=%1"
if "%arg%" == "admin" (
    echo ! Restarted with Admin rights
    echo.
) else (
    powershell -Command "Start-Process 'cmd.exe' -ArgumentList '/k \"\"%~f0\" admin\"' -Verb RunAs"
    exit /b
)
taskkill /f /im "lghub.exe" /t
taskkill /f /im "lghub_agent.exe" /t
taskkill /f /im "lghub_updater.exe" /t
taskkill /f /im "lghub_system_tray.exe"
taskkill /f /im "lghub_crashpad_handler.exe"
taskkill /f /im "lghub_software_manager.exe"
powershell Stop-Service -name LGHUBUpdaterService -force
exit
