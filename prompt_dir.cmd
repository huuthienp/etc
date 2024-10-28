@echo off
for %%i in ("%cd%") do set "cwd=%%~ni"
prompt %cwd%$G 
