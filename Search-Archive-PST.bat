echo off
set "DriveLetter=H:"
set netcheckunc="\\npi.int\dfs"
title=Search Archive PST Files.
cls
echo Checking connection to H drive, please wait...
if not exist %netcheckunc% goto localsearch
if not exist %DriveLetter% goto localsearch
echo.
echo H Drive found; creating a new Folder "Search Result" in H drive
echo.

cd c:\

mkdir "H:\Search Result"
echo Searching for Archive files, please be patient...
echo.
dir /s/a c:\*.pst> "H:\Search Result\Local_Archive_List.txt"


dir /s/a H:\*.pst> "H:\Search Result\Final_Archive_List.txt"


echo.
goto eof

:localsearch
echo H drive NOT FOUND, Arvhives search result will be copiecd to 
echo C:\users\%USERNAME%\Search Result.
echo.
mkdir "C:\users\%USERNAME%\Search Result"

echo Searching for Archive files, please be patient...
echo.
dir /s/a c:\*.pst> "C:\users\%USERNAME%\Search Result\Local_Archive_List.txt"


echo.

:eof
echo Done!
pause