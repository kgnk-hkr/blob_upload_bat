$username = Read-Host "Azure�A�J�E���g"
$password = Read-Host "�p�X���[�h" -AsSecureString

az login -u $username -p $password
if (!$?) {
    Write-Error "Error creating storage account"
    exit 2
}else{
	exit 0
}
