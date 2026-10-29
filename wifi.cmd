@REM @echo off

for %%G in (%*) do (
  call :connect
)
goto :eof

:connect
  piactl background enable ^
    && piactl connect ^
    && netsh wlan connect "wifi_2G"
  goto :eof

:disconnect
  goto :eof
