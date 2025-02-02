@echo off
chcp 65001>nul
title lghub-heal

:: Source: https://github.com/N3M1X10/lghub-heal

set "arg=%1"
if "%arg%" == "admin" (
    echo ! Restarted with Admin rights
    echo.
) else (
    powershell -Command "Start-Process 'cmd.exe' -ArgumentList '/k \"\"%~f0\" admin\"' -Verb RunAs"
    exit /b
)

set BIN=bin
set installer=lghub_installer.exe
cd /d "%~dp0"

echo.
echo ! Останавливаю всё связанное с G HUB . . .
echo.
taskkill /f /im "lghub.exe" /t
taskkill /f /im "lghub_agent.exe"
taskkill /f /im "lghub_updater.exe"
taskkill /f /im "lghub_system_tray.exe"
taskkill /f /im "lghub_crashpad_handler.exe"
taskkill /f /im "lghub_software_manager.exe"
timeout /t 1 /nobreak >nul
echo.

echo ! Установщик тоже надо остановить . . .
echo.
taskkill /f /im "lghub_installer.exe"
timeout /t 1 /nobreak >nul
echo.

echo ! Останавливаю службу обновления . . .
echo.
net stop "LGHUBUpdaterService"
sc pause "LGHUBUpdaterService"
timeout /t 1 /nobreak >nul
cls

:download-new
echo ! Скачиваю актуальный Logitech G Hub Installer
echo.
:: Пересоздаю папку
rmdir /q /s %BIN%
mkdir %BIN%
:: Качаю установщик lghub через curl
curl ^
--output "%~dp0%BIN%\%installer%" ^
"https://download01.logi.com/web/ftp/pub/techsupport/gaming/lghub_installer.exe"
echo.
echo Скачивание завершено
::пауза
>nul timeout /t 1 /nobreak >nul
cls

IF EXIST "%BIN%\%installer%" (
goto begin_heal
) else (
echo Установщик не найден, продолжение не возможно 
echo Нажмите любую кнопку чтобы выйти . . . &pause>nul&exit
)

:begin_heal
echo.
start "%BIN%\" "%BIN%\%installer%" ^
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

::checking_cycle
set att_count=1
set process=lghub_installer.exe
:cycle
cls
echo ! Удаляю G HUB . . .
echo Тут надо чучуть подождать . . .
echo Проверяем как там lghub_installer: %att_count%
>nul timeout /t 1 /nobreak
rem tasklist |>nul findstr /b /l /i /c:%process% && echo lghub_installer работает, пожалуйста подождите
tasklist |>nul findstr /b /l /i /c:%process% || goto uninstall_complete
set /a att_count=%att_count%+1
echo.
goto cycle

:uninstall_complete
echo.
echo ! Удаление завершено
::пауза
>nul timeout /t 2 /nobreak >nul
cls
goto run_install

:run_install
echo.
echo ! Ставлю новый G HUB со старыми настройками . . .
echo Тут надо подождать немного побольше . . .
echo.
start "%BIN%\" "%BIN%\%installer%" ^
--language="ru_RU" ^
--log ^
--save_settings ^
--saveSettings ^
--skip_copy ^
--skipCopy ^
--silent

::Проверка запуска установщика
>nul timeout /t 2 /nobreak
tasklist |>nul findstr /b /l /i /c:%process% || goto runinstfail
tasklist |>nul findstr /b /l /i /c:%process% && goto runinstsuccess
:runinstfail
echo !!! Установщик не запустился
echo Пробую перезапустить
echo.
timeout /t 2 /nobreak
goto run_install
:runinstsuccess
echo ! Установщик запустился
echo.
>nul timeout /t 2 /nobreak
goto installer_is_working

:installer_is_working
echo Теперь нужно ждать появления окна G HUB
echo Сейчас он устанавливается в фоне . . .
echo Его появление будет означать что переустановка завершена
echo ! Это окно можно закрыть (закроется само, как только lghub запустится)
echo.

::checking_cycle_lghub
set process_lghub=lghub.exe
:cycle_lghub
>nul timeout /t 1 /nobreak
tasklist |>nul findstr /b /l /i /c:%process_lghub% && goto end
set /a att_count=%att_count%+1
goto cycle_lghub

:end
rmdir /q /s %BIN%
exit
