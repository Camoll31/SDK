:DetectEngine
For /F "Tokens=2*" %%i in ('Reg Query "HKCU\Software\Valve\Source SDK" /v EngineVer') do (
	Set EngineVer=%%j
)

:CheckL4DLaunch
If /i "%EngineVer%"=="l4d" (
	Start GUIStudioMDL-L4D.exe
	Exit
)
If /i "%EngineVer%"=="l4d2" (
	Start GUIStudioMDL-L4D.exe
	Exit
)
If /i "%EngineVer%"=="asw" (
	Start GUIStudioMDL-ASW.exe
	Exit
)
:CheckEP1Launch
If /i "%EngineVer%"=="ep1" (
	Start GUIStudioMDL.exe
	Exit
)

If exist "%sourcesdk%\bin\orangebox\Rev.ini" (
	If exist "%sourcesdk%\bin\orangebox\Rev.tmp" (Del /F /Q "%sourcesdk%\bin\orangebox\Rev.tmp")
	Rename "%sourcesdk%\bin\orangebox\Rev.ini" "Rev.tmp"
)

:Run_OB
Start /w GUIStudioMDL.exe

If exist "%sourcesdk%\bin\orangebox\Rev.tmp" (
	If exist "%sourcesdk%\bin\orangebox\Rev.ini" (Del /F /Q "%sourcesdk%\bin\orangebox\Rev.ini")
	Rename "%sourcesdk%\bin\orangebox\Rev.tmp" "Rev.ini"
)

Exit
