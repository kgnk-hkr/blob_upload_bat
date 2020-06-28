## 使用環境
PowerShellにAzure CLIがインストールされていること。  
アップロードするファイルを格納したローカルフォルダが用意されていること。  
アップロード先のblobストレージが用意されていること。  

## batファイルの実行手順
下記ファイルが同じフォルダ配下にあることを確認します。  
	FileUpload.ps1  
	login.ps1  
	Upload.bat  
  
[Upload.bat]をダブルクリックします。  
コマンドプロンプトが起動します。  
  
アップロード先のAzureにログインできるアカウント情報を入力します。  
正常にログインができると、"Azureアカウントへのログインに成功しました"の文言が表示されます。  
  
ファイルをアップロードするための情報を入力します。  
デフォルト値を使用する場合は、空欄のままEnterキーを入力します。  
アップロード元のフォルダーパスには、事前に用意しているフォルダパスを入力します。  
  
アップロードが正常に完了すると、"アップロードに成功しました。"の文言が表示されます。  
  
任意のキーを押して、コマンドプロンプトを終了します。  
  
[Upload.bat]と同じフォルダ配下に下記のファイルが生成されます。  
アップロード先のフォルダに格納されているファイルの一覧が記録されています。  
	日付_before_upload_list.txt  
	日付_after_upload_list.txt  
アップロード対象のファイルが[日付_after_upload_list.txt]に記載されていることを確認します。  
