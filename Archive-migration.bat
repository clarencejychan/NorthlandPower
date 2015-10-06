echo off
set "DriveLetter=H:"
set netcheckunc="\\npi.int\dfs"
title=Personal Archive Migration.
cls
echo Checking connection to H drive, please wait...
if not exist %netcheckunc% goto localmigration
if not exist %DriveLetter% goto localmigration
echo.
echo H Drive found; creating a new Folder "Archive Migration" in H drive
echo.

cd c:\

mkdir "H:\Archive Migration"
echo Searching for Archive files, please be patient...
echo.
dir /s/a c:\*.pst> "H:\Archive Migration\my_Archive_List.txt"

echo Copying Archive files to H drive; this might take a little while !
echo.
for /R C: %%G IN (*.pst) DO xcopy "%%G" "H:\Archive Migration"

dir /s/a H:\*.pst> "H:\Archive Migration\Final_Archive_List.txt"

echo Closing Archive migration...

echo.
goto eof

:localmigration
echo H drive NOT FOUND, Arvhives will be copiecd to 
echo C:\users\%USERNAME%\Archive Migration.
echo.
mkdir "C:\users\%USERNAME%\Archive Migration"

echo Searching for Archive files, please be patient...
echo.
dir /s/a c:\*.pst> "C:\users\%USERNAME%\Archive Migration\my_Archive_List.txt"

echo Copying Archive files to your profile, this might take a little while !
echo.
for /R C: %%G IN (*.pst) DO xcopy "%%G" "C:\users\%USERNAME%\Archive Migration"

echo Done copying Files...

echo.

:eof
echo Done!
pause