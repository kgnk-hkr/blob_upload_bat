:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::	�f�o�C�X�摜�A�b�v���[�h�o�b�`                       ::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::�ύX����
::1.0 ����
::

@echo off

echo %time%
set time2=%time: =0%
 
set hh=%time2:~0,2%
set mn=%time2:~3,2%
set ss=%time2:~6,2%

:: ID����
set id=%date:/=%-%hh%%mn%%ss%

SET BAT_LOG=%~dp0\%id%_�X�N���v�g���s����.txt

echo "Azure�ւ̃��O�C��������͂��Ă�������"
PowerShell -File %~dp0\login.ps1 >> %BAT_LOG%
::powershell -command %~dp0\login.ps1;exit $LASTEXITCODE >> %BAT_LOG%
@IF %ERRORLEVEL% NEQ 0 (
echo "Azure�A�J�E���g�ւ̃��O�C���Ɏ��s���܂����B���͒l���m�F���Ă��������B"
echo %ERRORLEVEL%
pause
exit
)
echo "Azure�A�J�E���g�ւ̃��O�C���ɐ������܂����B"
echo %ERRORLEVEL%

echo "�A�b�v���[�h�̂��߂̏�����͂��Ă�������"
PowerShell -File %~dp0\DevicePicUpload.ps1 >> %BAT_LOG%
::powershell -command %~dp0\DevicePicUpload.ps1;exit $LASTEXITCODE >> %BAT_LOG%
@IF %ERRORLEVEL% NEQ 0 (
echo "�A�b�v���[�h�Ɏ��s���܂����B���͒l���m�F���Ă��������B"
echo %ERRORLEVEL%
pause
exit
)
echo "�A�b�v���[�h�ɐ������܂����B"
echo %ERRORLEVEL%
pause


