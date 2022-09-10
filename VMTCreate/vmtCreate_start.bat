if /i "%~1"=="" (exit)
set VProject=%~1

echo %SDK_Root%\sourcesdk_content\generic\materialsrc>setup.ini
echo %VProject%\materials>>setup.ini
echo.>>setup.ini

start vmtCreate.exe
exit
