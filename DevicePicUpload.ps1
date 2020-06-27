$defaultaccountname = 'defaultaccountname'
$accountname = Read-Host "ストレージアカウント名[デフォルト値：$($defaultaccountname)]"
$accountname = ($defaultaccountname,$accountname)[[bool]$accountname]

$defaultcontainername = '$web'
$containername = Read-Host "コンテナ名[デフォルト値：$($defaultcontainername)]"
$containername = ($defaultcontainername,$containername)[[bool]$containername]

$defaultdestinationpath = '/images/'
$destinationpath = Read-Host "アップロード先のパス[デフォルト値：$($defaultdestinationpath)]"
$destinationpath = ($defaultdestinationpath,$destinationpath)[[bool]$destinationpath]

$sourcepath = Read-Host "アップロード元のフォルダーパス"

$date = (Get-Date -F G).Replace('/','').Replace(' ','_').Replace(':','');
$destbefore = $date + "_before_upload_list.txt"
$destafter = $date + "_after_upload_list.txt"

$output1 = az storage blob list  --account-name $accountname --container-name $containername --output table --prefix $destinationpath > $destbefore
if (!$?) {
    Write-Error "ログの取得に失敗しました。パラメータを確認してください。"
    exit 2
}

$output2 = az storage blob upload-batch --account-name $accountname -d $containername --destination-path $destinationpath -s $sourcepath 
if (!$?) {
    Write-Error "ファイルのアップロードに失敗しました。パラメータを確認してください。"
    exit 2
}

$output3 = az storage blob list  --account-name $accountname --container-name $containername --output table --prefix $destinationpath > $destafter
if (!$?) {
    Write-Error "ログの取得に失敗しました。パラメータを確認してください。"
    exit 2
}else{
	exit 0
}



