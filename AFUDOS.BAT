REM ////此BATCH中所下的判斷式無法在純DOS中被執行，因Pure DOS下不支援SET /P or CHOICE等使用者輸入模式...////

@echo off

echo ----------------------
echo     AFUDOS V5
echo ----------------------
cd afudos5
echo Checking the BIOS ROM file information...
afudos c:\%1 /U
REM //參數/U可以先檢查BIOS ROM File的ID是否和要刷的板子有一致
echo If above information is corrected press "Y" to flash BIOS
echo Else press "N" to Abort.
SET /P OKNG=">>>" 
if /i "%OKNG%"=="Y" (
    afudos c:\%1 %2 %3 %4 %5 %6
	goto finish
) else (
    goto abort
)
REM //if /i 可以無視大小寫去判斷值
REM //變數在IF中要判斷時,若為字元而非數字則變名前後要加雙引號

:abort
echo Abort the BIOS flashing....
goto quit
REM //如果不下另一個goto到結尾，batch會自動往下執行，別的case也會被載入執行...

:finish
cd\

:quit