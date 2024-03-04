@echo off

type nul > users.txt
dir C:\Users\* > users.txt


type nul > users2.txt

setlocal enabledelayedexpansion
set "file1=users.txt"
set "file2=users2.txt"

for /f "delims=" %%a in (!file1!) do (
    set "line=%%a"
    set "str=!line:~36!"
    echo !str!>>!file2!
)


type nul > users3.txt

setlocal enabledelayedexpansion
set "file1=users2.txt"
set "file2=users3.txt"
set /a count=0

for /f "delims=" %%a in (!file1!) do (
    set /a count+=1
    if !count! equ 6 (
        echo %%a >> !file2!
    )
)


type nul > users.bat 
type nul > users4.txt

echo net user > users4.txt
type users3.txt >> users4.txt

type nul > users5.txt

setlocal enabledelayedexpansion
set "file1=users4.txt"
set "file2=users5.txt"
set /a count=0
set "prevLine="

for /f "delims=" %%a in (!file1!) do (
    set /a count+=1
    if !count! lss 2 (
        set "prevLine=%%a"
    ) else (
        echo !prevLine! %%a >> !file2!
        set /a count=0
    )
)


type nul > users6.txt
echo * >> users5.txt

set "file1=users5.txt"
set "file2=users6.txt"
set /a count=0
set "prevLine="

for /f "delims=" %%a in (!file1!) do (
    set /a count+=1
    if !count! lss 2 (
        set "prevLine=%%a"
    ) else (
        echo !prevLine! %%a >> !file2!
        set /a count=0
    )
)

type users6.txt > users.bat
echo cls >> users.bat
echo exit >> users.bat
start users.bat
pause
del users.txt
del users2.txt
del users3.txt
del users4.txt
del users5.txt
del users6.txt
del users.bat
cls
exit

