@echo off
set hashcommand="certutil -hashfile PPC-3100S-CleanOS.txt MD5 | findstr /v [C]ertUtil | findstr /v /C:):"
REM findstr可以下二次，第二次的結果會是第一次Filter濾完後的結果再去篩出第二個filter的結果。

for /f "usebackq tokens=1" %%i in (`%hashcommand%`) do SET Hashvalue=%%i
REM 將欲執行指令所得的結果傳達給變數，供之後使用時要用 for /f "usebackq tokens"

set hashtext="findstr /C:): /V MD5.txt"
REM 檢查MD5.txt預先附上的checksum library其Hash值的指令放入變數

for /f "usebackq tokens=1" %%j in (`%hashtext%`) do SET Hashtextvalue=%%j
REM 把指令所得結果放入變數中

if "%Hashvalue%" == "%Hashtextvalue%" (
    echo File checksum is correct!
) else (
    echo Check failed!
	echo - File Checksum is     %Hashvalue%
	echo - Checksum library is  %Hashtextvalue%
)

REM set LineCheck="findstr /c:004 /N MD5.txt"
REM for /f "usebackq tokens=1" %%k in (`%LineCheck%`) do SET HashLine=%%k
REM echo %HashLine:~0,1%
REM set /a HashLine=%HashLine:~0,1%
REM echo %HashLine%
REM 只取變數中第一個字

REM 印出文字檔逐行的內容
set /P filename=""
for /f "tokens=1-10 delims==" %%l in (MD5.txt) do (
	echo %%l
)

REM for /f "tokens=1-10 delims==" %%l in (MD5.txt) do (
REM	echo %%l
REM )

:jumpout