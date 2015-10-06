@Echo off
Echo Installing software for deployment
Echo .

:CheckOS
IF EXIST "%PROGRAMFILES(X86)%" (GOTO 64BIT) ELSE (GOTO 32BIT)

:64BIT
echo 64-bit...
echo Beginning installation of Silverlight, Java, Flash


REM Silverlight Install-----------------------------------------------

echo Press any key to begin Silverlight installation
pause >nul


if not exist "C:\Program Files (x86)\Microsoft Silverlight" (
pushd \\svr12-fpvm\data\deployment\InstallationPrograms
echo ...
echo Instaling now.
echo ...
echo ...
silverlight.exe /q /doNotRequireDRMPrompt /noupdate
popd) else (
echo It Exists already, uninstalling old version and installing new
echo ...
echo uninstalling now
MsiExec.exe /X{89F4137D-6C26-4A84-BDB8-2E5A4BB71E00} /qn
echo Done!
pushd \\svr12-fpvm\data\deployment\InstallationPrograms
echo ...
echo Installing now.
echo ...
echo ...
Silverlight.exe /q /doNotRequireDRMPrompt /noupdate
popd)



REM Java Install-----------------------------------------------

echo Installing Java now...

if not exist "C:\Program Files (x86)\Java" (
push \\svr12-fpvm\data\deployment\InstallationPrograms
echo ...
echo Installing now.
jre-8u45-windows-x64.exe /s
popd) else (
echo It exists already, uninstalling old version and installing new
echo ...
echo Uninstalling now...
MsiExec.exe /X{26A24AE4-039D-4CA4-87B4-2F83218045F0} /qn
echo Done!
pushd \\svr12-fpvm\data\deployment\InstallationPrograms
echo ...
echo Installing now.
jre-8u45-windows-x64.exe /s
popd)

GOTO END


REM ---------------------------------------------------------------------------------------------------


:32BIT
echo 32-bit...
echo Beginning Installation of Silverlight, Java, Flash ...
echo ...

REM Silverlight Install-----------------------------------------------

echo Installing Silverlight now...

if not exist "C:\Program Files\Microsoft Silverlight" (
pushd \\svr12-fpvm\data\deployment\InstallationPrograms
echo ...
echo Installing now.
echo ...
echo ...
Silverlight.exe  /q /doNotRequireDRMPrompt /noupdate
popd) else ( 
echo It exists already, uninstalling old version and installing new 
echo ...
echo Uninstalling now
MsiExec.exe /X{89F4137D-6C26-4A84-BDB8-2E5A4BB71E00} /qn
echo Done!
pushd \\svr12-fpvm\data\deployment\InstallationPrograms
echo ...
echo Installing now.
echo ...
echo ...
Silverlight.exe  /q /doNotRequireDRMPrompt /noupdate
popd)




REM Java Install-----------------------------------------------

echo Installing Java now...

if not exist "C:\Program Files\Java" (
pushd \\svr12-fpvm\data\deployment\InstallationPrograms
echo ...
echo Installing now.
JavaSetup8u45.exe /s
popd) else (
echo It exists already, uninstalling old version and installing new
echo ...
echo Uninstalling now...
MsiExec.exe /X{26A24AE4-039D-4CA4-87B4-2F83218045F0} /qn
echo Done!
pushd \\svr12-fpvm\data\deployment\InstallationPrograms
echo ...
echo Installing now.
JavaSetup8u45.exe /s
popd)
echo Done!




REM Flash Install-----------------------------------------------

echo Installing Flash Player now...
pushd \\svr12-fpvm\data\deployment\INstallationPrograms\
echo ...
echo Installing now.
Flash17.exe /qn
echo ...
echo ...
popd
echo Done!



REM -----------------------------------------------------------

GOTO END



:END
echo All installations complete! 
SET /P shutdown=Would you like to restart now? (y/n):
IF "%shutdown%"=="y" (
shutdown /r) else (
end)





