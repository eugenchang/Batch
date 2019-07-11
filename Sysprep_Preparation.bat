@echo off

REM \\\\ STEP 1 \\\\
REM \\Disable Guest account
echo Step 1.
echo     Disabling Guest account
net user Guest /active:no

REM \\\\ STEP 2 \\\\
REM \\Delete BSOD memory dump file
echo Step 2.
echo     Checking DUMP file in Windows directory.
dir /b %windir%\*.DMP
if %errorlevel% == 0 (
	DEL %windir%\*.DMP
	echo Cleaned DUMP file.
) else (
	echo No Any DUMP file in Windows directory.
)
REM \\Reset ErrorLevel value to 0" 
cmd /c "exit /b 0"

REM \\\\ STEP 3 \\\\
REM \\Delete minidump file
echo Step 3.
echo     Checking MINIDUMP file.
dir /b %windir%\minidump\*.DMP
if %errorlevel% == 0 (
	DEL %windir%\minidump\*.DMP
	echo Cleaned miniDUMP file.
) else (
	echo No Any mini DUMP file here.
)
REM \\Reset ErrorLevel value to 0" 
cmd /c "exit /b 0"

REM \\\\ STEP 4 \\\\
REM \\System clean up
echo Step 4. 
echo     Do system cleanup now.And it will spends a while.
Cleanmgr /AUTOCLEAN
echo System clean up DONE!

REM \\\\ STEP 5 \\\\
REM \\Remove System trash box to avoid trashbox error
echo Step 5.
echo     Pre-delete Trash can to avoid trash can error message after sysprep finished.
RD /s /q C:\$RECYCLE.BIN
dir /b /a C:\$RECYCLE.BIN
if %errorlevel% == 1 (
	echo Trash can has been deleted.
)
REM \\Reset ErrorLevel value to 0" 
cmd /c "exit /b 0"

REM \\[Skip]Make a trashbox in shared folder to avoid trashbox error
REM \\MKDIR C:\DATA\SHARE\$RECYCLE.BIN
REM \\Attrib +h C:\DATA\SHARE\$RECYCLE.BIN /s /d

timeout /t 5 /NOBREAK

REM \\\\ STEP 6 \\\\
REM \\Do sysprep with Unattend.xml
echo Step 6.
REM \\Confirm above steps are all DONE!
choice /C YN /M "Are you ready to execute SYSPREP?"
if %errorlevel% == 1 (
    goto SYSPREPSELECT
) else (
    echo Quiting Sysprep automation utility
	goto quit
)

:SYSPREPSELECT
REM \\Reset ErrorLevel value to 0" 
cmd /c "exit /b 0"
REM \\Confirm sysprep running mode is with unattend file or only run the general sysprep.
choice /C YN /M "Do you wanna run SYSPREP with unattend.xml file?"
if %errorlevel% == 1 (
    echo -----------------------------------------------------------------------------------------------
	echo     Please make sure Unattend.xml file has been placed in %windir%\system32\sysprep folder
	echo     If its OK press any key to continue.
	pause
	echo     Executing sysprep with Unattend file, after sysprep done the system will auto shutdown.
    %windir%\system32\sysprep\sysprep /generalize /oobe /shutdown /unattend:%windir%\system32\sysprep\Unattend.xml

) else (
    echo -----------------------------------------------------------------------------------------------
	echo     Executing sysprep GUI mode.
	%windir%\system32\sysprep\sysprep
)

:quit