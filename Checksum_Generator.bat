@echo off
setlocal enabledelayedexpansion
echo ---------------------------------------------
echo     Super Checksum Generating Tool
echo ---------------------------------------------
echo.
REM // Redirect to specific path.
echo Please drag and drop folder here for regenerating checksum.
set /P folder=">>>>"
REM // DO PATH check, remove uneccessary sympolif %folder:~1,1%==C (
if %folder:~1,1% == C (
	cd \%folder:~4%
	set folderchecker=0
) else (
	cd \%folder:~3%
	set folderchecker=1
)
REM // MENU
:MENU
echo.
echo.
echo.
echo ===== Checksum Generating Menu =====
echo ----- (1) MD5
echo ----- (2) SHA1
echo ----- (3) SHA256
echo ----- (4) ALL
echo.
echo.
echo ----- (Q) Quit
echo ============================================================
echo.
echo Please select generate checksum type.
SET /P Selection=">>>>"
if %Selection% == 1 (
	goto MD5
) else if %Selection% == 2 (
	goto SHA1
) else if %Selection% == 3 (
	goto SHA256
) else if %Selection% == 4 (
	goto ALL
) else if /i %Selection% == Q (
	goto Quit
) else (
	echo Command error return to MENU.
	timeout 3 /NOBREAK
	cls
	goto MENU
)

:MD5
echo Selected MD5
REM // Get all filename in folder
dir /b > filelist.txt
timeout 1 /NOBREAK
echo.
echo Regenerating MD5 Checksum......Please wait.....
echo It could take a while....
REM // Read text file line by line
for /f %%i in (filelist.txt) do (
	REM // Generate MD5 checksum file by file and fill in the value into text file.
	certutil -hashfile %%i MD5 | findstr /v [C]ertUtil >> MD5.txt
	echo. >> MD5.txt
)
echo.
echo "Finished!!Open MD5 file automatically!!"
timeout 1 /NOBREAK
start MD5.txt
goto Quit

:SHA1
echo Selected SHA1
REM // Get all filename in folder
dir /b > filelist.txt
timeout 1 /NOBREAK
echo Regenerating SHA1 Checksum......Please wait.....
echo It could take a while....
REM // Read text file line by line
for /f %%i in (filelist.txt) do (
	REM // Generate SHA1 checksum file by file and fill in the value into text file.
	certutil -hashfile %%i SHA1 | findstr /v [C]ertUtil >> SHA1.txt
	echo. >> SHA1.txt
)
echo.
echo "Finished!!Open SHA1 file automatically!!"
timeout 1 /NOBREAK
start SHA1.txt
goto Quit

:SHA256
echo Selected SHA256
REM // Get all filename in folder
dir /b > filelist.txt
timeout 1 /NOBREAK
echo Regenerating SHA256 Checksum......Please wait.....
echo It could take a while....
REM // Read text file line by line
for /f %%i in (filelist.txt) do (
	REM // Generate SHA256 checksum file by file and fill in the value into text file.
	certutil -hashfile %%i SHA256 | findstr /v [C]ertUtil >> SHA256.txt
	echo. >> SHA256.txt
)
echo.
echo "Finished!!Open SHA256 file automatically!!"
timeout 1 /NOBREAK
start SHA256.txt
goto Quit

:ALL
echo Selected ALL
REM // Get all filename in folder
dir /b > filelist.txt
timeout 1 /NOBREAK
REM // Generate SHA256 first.
echo .
echo ------------------------------------------------------------------
echo Step 1/3 - Regenerating SHA256 Checksum......Please wait.....
echo It could take a while....
REM // Read text file line by line
for /f %%i in (filelist.txt) do (
	REM // Generate SHA256 checksum file by file and fill in the value into text file.
	certutil -hashfile %%i SHA256 | findstr /v [C]ertUtil >> SHA256.txt
	echo. >> SHA256.txt
)
echo.
echo "Step 1/3 - SHA256 Finished!!"
timeout 1 /NOBREAK
REM // Generate SHA1
echo ------------------------------------------------------------------
echo Step 2/3 - Regenerating SHA1 Checksum......Please wait.....
echo It could take a while....
REM // Read text file line by line
for /f %%i in (filelist.txt) do (
	REM // Generate SHA1 checksum file by file and fill in the value into text file.
	certutil -hashfile %%i SHA1 | findstr /v [C]ertUtil >> SHA1.txt
	echo. >> SHA1.txt
)
echo.
echo "Step 2/3 - SHA1 Finished!!"
timeout 1 /NOBREAK
REM // Generate MD5
echo.
echo ------------------------------------------------------------------
echo Step 3/3 - Regenerating MD5 Checksum......Please wait.....
echo It could take a while....
REM // Read text file line by line
for /f %%i in (filelist.txt) do (
	REM // Generate MD5 checksum file by file and fill in the value into text file.
	certutil -hashfile %%i MD5 | findstr /v [C]ertUtil >> MD5.txt
	echo. >> MD5.txt
)
echo.
echo "Step 3/3 - MD5 Finished!!"
timeout 1 /NOBREAK
echo All generating are finished, You can check the file in folder.
if %folderchecker% == 0 (
	explorer \%folder:~4%
) else (
	explorer \%folder:~3%
)
goto Quit


:Quit
echo Quit this program
exit