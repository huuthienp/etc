@echo off

SETLOCAL

@REM loop of argument parsing
for %%G in (%*) do (
  if defined _connect (
    set "_wifi_name=%%~G"
    set "_connect="
  ) & @rem this check must precede connect/disconnect check

  if /i "connect"=="%%~G" (
    set _connect=1
  ) else ( if /i "disconnect"=="%%~G" (
    set _disconnect=1
  ))

  if /i "pia"=="%%~G" (
    piactl background enable & @rem always returns 0
    piactl connect & @rem always returns 0
  )
) & @rem end of arg parsing

if defined _disconnect (
  call :disconnect
) else ( if defined _wifi_name (
  call :connect "%_wifi_name%"
))

ENDLOCAL

goto :eof

:connect
  @REM connect to wifi
  if ""=="%~1" (
    goto :eof
  )
  netsh wlan connect "%~1"
  goto :eof

:disconnect
  @REM disconnect from wifi first and then pia
  netsh wlan disconnect
  piactl disconnect & @rem always returns 0
  goto :eof
