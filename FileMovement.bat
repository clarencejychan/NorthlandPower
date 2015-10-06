@Echo off
title=Backing up files to H Drive:
echo Backing up files...
SET /P personal= Would you like to backup personal items (Music, Videos, Pictures) as well? (y/n):
SET /P date= Enter current date:
pushd \\svr12-fpvm\data\deployment
pushd H:\

mkdir Backup-%date% 

IF "%personal%"=="y" SET answer=TRUE
IF "%personal%"=="Y" SET answer=TRUE
IF "%personal%"=="n" SET answer=FALSE
IF "%personal%"=="N" SET answer=FALSE

IF "%answer%"=="TRUE" (
GOTO YESPERSONAL) else (
GOTO NOPERSONAL)



:YESPERSONAL
echo Backing up Music Files...

XCOPY "C:\Users\%USERNAME%\Music" "H:\Backup-%date%\Music" /E /H /I

cls

echo Backing up Video Files...

XCOPY "C:\Users\%USERNAME%\Videos" "H:\Backup-%date%\Videos" /E /H /I

cls

echo Backing up Pictures...

XCOPY "C:\Users\%USERNAME%\Pictures" "H:\Backup-%date%\Pictures" /E /H /I

cls

:NOPERSONAL

echo Backing up Document files...

XCOPY "C:\Users\%USERNAME%\Documents" "H:\Backup-%date%\Documents" /E /H /I

cls

echo Backing up desktop files...

XCOPY "C:\Users\%USERNAME%\Desktop" "H:\Backup-%date%\DesktopFiles" /E /H /I

cls

echo Backing up your Downloaded files...

XCOPY "C:\Users\%USERNAME%\Downloads" "H:\Backup-%date%\Downloads" /E /H /I

cls

echo Backing up your Favorites...

XCOPY "C:\Users\%USERNAME%\Favorites" "H:\Backup-%date%\Favorites" /E /H /I


echo Backing up your AppData Files...

XCOPY "C:\Users\%USERNAME%\AppData\Local\Microsoft\Outlook" "H:\Backup-%date%\Outlook" /E /H /I /EXCLUDE:\\svr12-fpvm\data\deployment\excludedfiletypes.txt
XCOPY "C:\Users\%USERNAME%\AppData\Local\Microsoft\OneNote" "H:\Backup-%date%\OneNote" /E /H /I
XCOPY "C:\Users\%USERNAME%\AppData\LocalLow\Google\GoogleEarth\myplaces" "H:\Backup-%date%\Google Earth" /E /H /I
XCOPY "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Signatures" "H:\Backup-%date%\OutlookSigs" /E /H /I
XCOPY "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Templates" "H:\Backup-%date%\Templates" /E /H /I
XCOPY "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Outlook" "H:\Backup-%date%\Outlook-Roaming" /E /H /I


cls

popd
popd


echo Done backing up your files! Press any key to exit. 

pause >nul


