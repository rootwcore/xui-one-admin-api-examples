@echo off
chcp 65001 >nul
title Upload to GitHub - XUI.ONE Admin API Repo

echo.
echo ============================================================
echo  XUI.ONE Admin API Repo - Upload to GitHub
echo ============================================================
echo.

powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0_github-upload\upload-to-github.ps1"

echo.
pause
