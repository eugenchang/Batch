@echo off
set /p InTest="Press Y or N >>"
if /i "%InTest%"=="Y" (
    echo you pressed YYYYYYYY
	goto finish
) else (
    echo NNNNNN-NGNGNGNG
	goto abort
)

:abort
echo abort
timeout 2 /NOBREAK
goto quit 
REM //如果不下另一個goto到結尾，batch會自動往下執行，別的case也會被載入執行...

:finish
echo DONE
goto quit

:quit