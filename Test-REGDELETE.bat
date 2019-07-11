reg delete "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" /v CaptionHeight /f
reg delete "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" /v CaptionWidth /f
reg delete "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" /v PaddedBorderWidth /f
reg delete "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" /v ScrollHeight /f
reg delete "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" /v ScrollWidth /f 
reg add "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" /v CaptionHeight /t REG_SZ /d -180 /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" /v CaptionWidth /t REG_SZ /d -180 /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" /v PaddedBorderWidth /t REG_SZ /d 0 /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" /v ScrollHeight /t REG_SZ /d -210 /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" /v ScrollWidth /t REG_SZ /d -210 /f 