@echo off

set sympolmark=$
echo %sympolmark%
timeout 2 /NOBREAK
set location=#1234556667777
echo %location%
if %location:~0,1% == %sympolmark% (
	echo It is included.
) else (
	echo NO
)

REM // About Double Quotation ", It seems cannot be input along in var... check will be error.