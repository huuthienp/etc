@echo off
for %%i in ("%cd%") do set "cwd=%%~nxi"
prompt %cwd%$G 
