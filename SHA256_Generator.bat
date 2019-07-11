@echo off
echo ---------------------------------------------
echo     SHA256 Checksum Generate Tool
echo ---------------------------------------------
echo.
REM // Redirect to specific path.
echo Please drag and drop folder here for regenerating SHA256 checksum.
set /P folder=">>>>"
cd %folder:~2%
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