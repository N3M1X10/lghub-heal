@echo off
chcp 65001 >nul
title lghub_uninstall

:: Source: https://github.com/N3M1X10/lghub-heal

set "arg=%1"
if "%arg%" == "admin" (
    echo ! Restarted with Admin rights
    echo.
) else (
    powershell -Command "Start-Process 'cmd.exe' -ArgumentList '/k \"\"%~f0\" admin\"' -Verb RunAs"
    exit /b
)

echo ! closing whole lghub
taskkill /f /im "lghub.exe" /t
taskkill /f /im "lghub_agent.exe" /t
taskkill /f /im "lghub_updater.exe" /t
taskkill /f /im "lghub_system_tray.exe"
taskkill /f /im "lghub_crashpad_handler.exe"
taskkill /f /im "lghub_software_manager.exe"
taskkill /f /im "lghub_installer.exe"
>nul timeout /t 1 /nobreak

powershell Stop-Service -name LGHUBUpdaterService -force
>nul timeout /t 1 /nobreak
cls

:: Working Directory
set BIN=bin
set installer=lghub_installer.exe
cd /d "%~dp0"

IF EXIST "%BIN%\%installer%" (
goto asking
) else (
echo installer has not found
echo ! Downloading the new Logitech G Hub Installer
rmdir /q /s %BIN%
mkdir %BIN%
curl ^
--output "%~dp0%BIN%\%installer%" ^
"https://download01.logi.com/web/ftp/pub/techsupport/gaming/lghub_installer.exe"
echo.
echo ! Downloading complete
>nul timeout /t 1 /nobreak >nul
if exist "%BIN%\%installer%" (goto asking) else (echo ! Error downloading &pause&exit)
cls
)


::Ask yourself
:asking
set /p arg=Do you want Save lghub settings? [Y/N]: 
if "%arg%"=="y" goto save_settings
if "%arg%"=="Y" goto save_settings
if "%arg%"=="n" goto full_c
if "%arg%"=="N" goto full_c

:full_c
set /p sure=Are you sure you want to completely uninstall lghub ? [Y]: 
if "%sure%"=="y" cls & goto full_uninstall
echo Batch will stopped &pause&exit



:save_settings
echo ! starting uninstaller (save settings)
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
goto end

:full_uninstall
echo ! starting uninstaller (full uninstall)
start "" "lghub_installer.exe" ^
--skip_copy ^
--skipCopy ^
--uninstall ^
--uninstall_temp ^
--uninstallTemp ^
--silent
goto end

:end
echo.
exit /b
