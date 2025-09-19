@echo off
chcp 65001 >nul
setlocal

choice /c YN /m "Перезапустить компьютер сейчас?"
if errorlevel 2 goto no
if errorlevel 1 goto yes

:yes
echo Перезапуск...
shutdown /r /t 0
goto end

:no
echo Перезапуск отменен.

:end
endlocal
