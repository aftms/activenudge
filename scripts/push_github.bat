@echo off
setlocal

set "ROOT=%~dp0.."
cd /d "%ROOT%"

echo.
echo ActiveNudge - GitHub push helper
echo --------------------------------

git rev-parse --is-inside-work-tree >nul 2>&1
if errorlevel 1 (
  echo This folder is not a Git repository.
  exit /b 1
)

git remote get-url origin >nul 2>&1
if errorlevel 1 (
  echo No Git remote named origin is configured.
  exit /b 1
)

echo.
echo Current branch:
git branch --show-current

echo.
echo Current status:
git status --short

echo.
set /p "CONTINUE=Stage all changes, commit, and push to GitHub? [y/N]: "
if /i not "%CONTINUE%"=="y" (
  echo Cancelled.
  exit /b 0
)

git add -A
if errorlevel 1 exit /b 1

git diff --cached --quiet
if errorlevel 1 (
  echo.
  set /p "COMMIT_MESSAGE=Commit message: "
  if "%COMMIT_MESSAGE%"=="" (
    echo Commit message is required.
    exit /b 1
  )

  git commit -m "%COMMIT_MESSAGE%"
  if errorlevel 1 exit /b 1
) else (
  echo.
  echo No changes to commit.
)

echo.
git push
if errorlevel 1 exit /b 1

echo.
echo Done.
