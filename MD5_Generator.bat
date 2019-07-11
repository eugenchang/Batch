@echo off
echo ---------------------------------------------
echo     MD5 Checksum Generate Tool
echo ---------------------------------------------
echo.
REM // Redirect to specific path.
echo Please drag and drop folder here for regenerating MD5 checksum.
set /P folder=">>>>"
cd %folder:~2%
REM // Get all filename in folder
dir /b > filelist.txt
timeout 1 /NOBREAK
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