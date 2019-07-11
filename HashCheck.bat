@echo off

setlocal EnableDelayedExpansion
for %%i in (*.*) do (
	REM 檢查folder中所有的檔案輪詢所有的檔名
	set filename=%%i
	REM 把檔名帶入變數filename
	echo !filename!
	set command="certutil -hashfile !filename! MD5 ^| findstr /v [C]ertUtil ^| findstr /v /C:^):"
	REM 將執行certutil來檢查檔案checksum指令先存入變數
	for /f "usebackq tokens=*" %%j in (`!command!`) do (
		REM 迴圈一個一個檢案folder中所有檔案的Hash值
		set Hashvalue=%%j
		REM 帶入跑出的Hash值給變數
		echo !Hashvalue!
		findstr !Hashvalue! MD5.txt
		REM 查詢跑出的Hash值是否有包含在之前生成的MD5保存檔中
		if %errorlevel% == 0 (
			REM 如果上述查詢為TRUE，顯示checksum檢查OK
			echo !filename! checksum OK.
		) else (
			REM 反之 Errorlevel為1 false的話，就顯示checksum檢查有錯
			echo !filename! checksum Failed.
		)
	)
)