@echo off
setlocal enabledelayedexpansion

echo Scanning for uncommitted changes...
echo.

REM Enumerate folders
for /f "delims=" %%i in ('dir /s /b /ad .git') do (
    REM echo %%i
    pushd %%i\..\
    git st | findstr /v master > NUL
    if !errorlevel! equ 0 (
        echo %%i
        git st
    )
    popd
)

echo.
echo Done.
endlocal
