$username = Read-Host "Azureアカウント"
$password = Read-Host "パスワード" -AsSecureString

az login -u $username -p $password
if (!$?) {
    Write-Error "Error creating storage account"
    exit 2
}else{
	exit 0
}
