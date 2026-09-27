@echo off
title Installer - Rainbow Matrix
cls

echo ===========================================
echo   Installing Rainbow Matrix Trick...
echo ===========================================
echo.

:: 1. Define the folder and file paths
set "target_dir=%USERPROFILE%\Documents\RainbowMatrix"
set "script_path=%target_dir%\rainbow_matrix.cmd"

:: 2. Create the target directory if it doesn't exist
if not exist "%target_dir%" mkdir "%target_dir%"

:: 3. Generate the matrix script file inside the directory
(
echo @echo off
echo title Rainbow Matrix Loop
echo cls
echo :matrix_loop
echo color 0%%random:~-1%%
echo echo %%random%% %%random%% %%random%% %%random%% %%random%% %%random%% %%random%% %%random%%
echo echo %%random%% %%random%% %%random%% %%random%% %%random%% %%random%% %%random%% %%random%%
echo timeout /t 1 ^>nul
echo goto matrix_loop
) > "%script_path%"

:: 4. Create a shortcut on the desktop using VBScript
set "shortcut_path=%USERPROFILE%\Desktop\Rainbow Matrix.lnk"
set "vbs_script=%temp%\CreateShortcut.vbs"

echo Set oWS = WScript.CreateObject("WScript.Shell") > "%vbs_script%"
echo sLinkFile = "%shortcut_path%" >> "%vbs_script%"
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> "%vbs_script%"
echo oLink.TargetPath = "%script_path%" >> "%vbs_script%"
echo oLink.Save >> "%vbs_script%"

cscript //nologo "%vbs_script%"
del "%vbs_script%"

echo.
echo ===========================================
echo   Installation Successful!
echo   A shortcut has been added to your Desktop.
echo ===========================================
pause
