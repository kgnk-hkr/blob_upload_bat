:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::	デバイス画像アップロードバッチ                       ::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::変更履歴
::1.0 初版
::

@echo off

echo %time%
set time2=%time: =0%
 
set hh=%time2:~0,2%
set mn=%time2:~3,2%
set ss=%time2:~6,2%

:: ID生成
set id=%date:/=%-%hh%%mn%%ss%

SET BAT_LOG=%~dp0\%id%_スクリプト実行結果.txt

echo "Azureへのログイン情報を入力してください"
PowerShell -File %~dp0\login.ps1 >> %BAT_LOG%
::powershell -command %~dp0\login.ps1;exit $LASTEXITCODE >> %BAT_LOG%
@IF %ERRORLEVEL% NEQ 0 (
echo "Azureアカウントへのログインに失敗しました。入力値を確認してください。"
echo %ERRORLEVEL%
pause
exit
)
echo "Azureアカウントへのログインに成功しました。"
echo %ERRORLEVEL%

echo "アップロードのための情報を入力してください"
PowerShell -File %~dp0\DevicePicUpload.ps1 >> %BAT_LOG%
::powershell -command %~dp0\FileUpload.ps1;exit $LASTEXITCODE >> %BAT_LOG%
@IF %ERRORLEVEL% NEQ 0 (
echo "アップロードに失敗しました。入力値を確認してください。"
echo %ERRORLEVEL%
pause
exit
)
echo "アップロードに成功しました。"
echo %ERRORLEVEL%
pause


