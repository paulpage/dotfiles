@echo off
pushd "C:\notes"
git pull
git add .
git diff --cached --exit-code && exit /b
git commit -m "Update from Windows %COMPUTERNAME%"
git push
popd
