@echo off
chcp 65001 >nul
setlocal EnableExtensions EnableDelayedExpansion

choice /c RS /m "Выберите действие: R - перезапуск, S - выключение"
if errorlevel 2 goto set_shutdown
if errorlevel 1 goto set_restart

:set_restart
set "action_command=shutdown /r /t 0"
set "action_name=перезапуск"
set "action_progress=Перезапуск..."
set "action_cancel=Перезапуск отменен."
goto confirm

:set_shutdown
set "action_command=shutdown /s /t 0"
set "action_name=выключение"
set "action_progress=Выключение..."
set "action_cancel=Выключение отменено."
goto confirm

:confirm
choice /c YN /m "Выполнить !action_name! сейчас?"
if errorlevel 2 goto cancel
if errorlevel 1 goto execute

:execute
echo !action_progress!
if defined DRY_RUN (
  echo [Тестовый режим] Команда: !action_command!
) else (
  !action_command!
)
goto end

:cancel
echo !action_cancel!
goto end

:end
endlocal