@ECHO OFF

git pull origin master;
git submodule init
git submodule update

SET arg1=%1

IF /I "%arg1%"=="-f" (
	CALL :doIt
	EXIT /B %ERRORLEVEL%
)
IF /I "%arg1%"=="--force" (
	CALL :doIt
	EXIT /B %ERRORLEVEL%
)

set /p reply=This may overwrite existing files in your home directory. Are you sure? (y/n)?:
echo %reply%
IF /I "%reply%"=="y" (
	CALL :doIt
)

EXIT /B %ERRORLEVEL%

:: a function to perform the action
:doIt
SET source=%CD%
SET dest=%USERPROFILE%
SET bootstrapbat=%CD%\bootstrap.bat
SET bootstrapsh=%CD%\bootstrap.sh
SET license=%CD%\LICENSE
SET readme=%CD%\README.md
SET gitmodules=%CD%\.gitmodules
SET gitignore=%CD%\.gitignore

robocopy %source% %dest% /E /Z /XF %bootstrapbat% /XF %bootstrapsh% /XF %license% /XF %readme% /XF %gitmodules% /XF %gitignore%
vim +PluginInstall +qall
EXIT /B 0