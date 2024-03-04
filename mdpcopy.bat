type nul > users.txt
dir C:\Users* > users.txt
type nul > users2.txt
setlocal enabledelayedexpansion
et 'file1=users.txt'
set 'file2=users2.txt'
for /f 'delims=' %%a in (!file1!) do (
    set 'line=%%a'
    set 'str=!line:~36!'
    echo !str!>>!file2!
)
type nul > users3.txt
setlocal enabledelayedexpansion
set 'file1=users2.txt'
set 'file2=users3.txt'
set /a count=0
for /f 'delims=' %%a in (!file1!) do (
