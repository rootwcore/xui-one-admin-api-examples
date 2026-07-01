@echo off
chcp 65001 >nul
title Check Git

echo.
echo Checking Git version...
echo.
where git >nul 2>&1
if %errorlevel%==0 (
    git --version
    echo.
    echo Git is ready.
) else (
    echo Git was not found. Run INSTALL_GIT_WINDOWS.bat first.
)
echo.
pause
