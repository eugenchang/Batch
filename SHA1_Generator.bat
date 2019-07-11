@echo off
echo ---------------------------------------------
echo     SHA1 Checksum Generate Tool
echo ---------------------------------------------
echo.
REM // Redirect to specific path.
echo Please drag and drop folder here for regenerating SHA1 checksum.
set /P folder=">>>>"
cd %folder:~2%
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