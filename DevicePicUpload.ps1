$defaultaccountname = 'defaultaccountname'
$accountname = Read-Host "�X�g���[�W�A�J�E���g��[�f�t�H���g�l�F$($defaultaccountname)]"
$accountname = ($defaultaccountname,$accountname)[[bool]$accountname]

$defaultcontainername = '$web'
$containername = Read-Host "�R���e�i��[�f�t�H���g�l�F$($defaultcontainername)]"
$containername = ($defaultcontainername,$containername)[[bool]$containername]

$defaultdestinationpath = '/images/'
$destinationpath = Read-Host "�A�b�v���[�h��̃p�X[�f�t�H���g�l�F$($defaultdestinationpath)]"
$destinationpath = ($defaultdestinationpath,$destinationpath)[[bool]$destinationpath]

$sourcepath = Read-Host "�A�b�v���[�h���̃t�H���_�[�p�X"

$date = (Get-Date -F G).Replace('/','').Replace(' ','_').Replace(':','');
$destbefore = $date + "_before_upload_list.txt"
$destafter = $date + "_after_upload_list.txt"

$output1 = az storage blob list  --account-name $accountname --container-name $containername --output table --prefix $destinationpath > $destbefore
if (!$?) {
    Write-Error "���O�̎擾�Ɏ��s���܂����B�p�����[�^���m�F���Ă��������B"
    exit 2
}

$output2 = az storage blob upload-batch --account-name $accountname -d $containername --destination-path $destinationpath -s $sourcepath 
if (!$?) {
    Write-Error "�t�@�C���̃A�b�v���[�h�Ɏ��s���܂����B�p�����[�^���m�F���Ă��������B"
    exit 2
}

$output3 = az storage blob list  --account-name $accountname --container-name $containername --output table --prefix $destinationpath > $destafter
if (!$?) {
    Write-Error "���O�̎擾�Ɏ��s���܂����B�p�����[�^���m�F���Ă��������B"
    exit 2
}else{
	exit 0
}



