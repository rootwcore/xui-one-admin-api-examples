@echo off
chcp 65001 >nul
title Install Git - XUI.ONE Admin API Repo

echo.
echo ============================================================
echo  Git Installation Check
echo ============================================================
echo.

where git >nul 2>&1
if %errorlevel%==0 (
    echo Git is already installed:
    git --version
    echo.
    echo Next step: run UPLOAD_TO_GITHUB_WINDOWS.bat.
    pause
    exit /b 0
)

echo Git was not found. Git for Windows will be installed with winget...
echo.

where winget >nul 2>&1
if not %errorlevel%==0 (
    echo Winget was not found. Opening the official Git download page.
    echo Complete the installation with the default options, then return to this folder and run UPLOAD_TO_GITHUB_WINDOWS.bat.
    start https://git-scm.com/install/windows
    pause
    exit /b 1
)

winget install --id Git.Git -e --source winget

echo.
echo If installation has completed, close this window.
echo Then open a new Command Prompt / PowerShell window, or run UPLOAD_TO_GITHUB_WINDOWS.bat directly.
echo.
pause
