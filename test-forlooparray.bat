@echo off

setlocal EnableDelayedExpansion
set test="Test Number is - "
for /l %%i in (1,1,10) do (
	set /a i=%%i
	call echo %%test[!i!]%%
)
REM It's failured.