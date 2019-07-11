@echo off
echo Step 1 - 
echo Deleting logon command
REM \\Delete all registries on HKLM Run 
Reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /va /f
timeout /t 2 /NOBREAK
REM \\Add system default registry back
Reg add HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v WindowsDefender /t REG_EXPAND_SZ /d "%userprofile%\Windows Defender\MSASCuiL.exe" /f
echo.
echo Step 2 -
echo Disabling Guest Account
REM \\Disable Guest account
net user Guest /active:no
echo.
echo Step 3 - 
echo Cleaning DUMP file
REM \\Delete BSOD memory dump file
DEL %windir%\*.DMP

REM \\Delete minidump file
DEL %windir%\minidump\*.DMP
echo.
echo Step 4 - 
echo Deleting Temp files of OMRON Utility
REM \\Remove directory OMRON FZ, This folder will be regenerated automatically.
RD /s /q "%userprofile%\OMRON FZ"
echo.
echo Step 5 - 
echo Excuting System Clean up manager
REM \\System clean up
Cleanmgr
echo.
echo Step 6 - 
echo Deleting RECYCLE.BIN for prevending trash can error issue
REM \\Remove System trash box to avoid trashbox error
RD /s /q C:\$RECYCLE.BIN

REM \\Make a trashbox in shared folder to avoid trashbox error
MKDIR C:\DATA\SHARE\$RECYCLE.BIN
Attrib +h C:\DATA\SHARE\$RECYCLE.BIN /s /d

timeout /t 5 /NOBREAK
echo.
echo.
echo --------------------------------------------------------------------------
echo The preparation of sysprep repack process is finished
echo System is ready for doing sysprep
REM \\Transit to sysprep folder and keep command prompt screen.
cd %windir%\system32\sysprep 
echo Sysprep executing....And after sysprep is done system will auto shutdown.
REM \\Do sysprep with Unattend.xml
sysprep /generalize /oobe /shutdown /unattend:Unattend.xml