(Get-Host).UI.RawUI.WindowTitle = "PowerShell"
$HiddenUserName = $true

Set-PSReadLineOption -PredictionSource History

Set-Alias open start-process

function isAdmin(){
    return ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")
}

function sign($file){
    Set-AuthenticodeSignature $(Resolve-Path $file) $(Get-ChildItem Cert:\LocalMachine\Root -CodeSigningCert | ?{$_.Thumbprint -eq "B1886273874AD44EC1F5392336DD55067670EF1B"})
}

function prompt(){

    # ディレクトリの短縮
    $currentPath = (Get-Location).Path.Replace($HOME,"~")

    # 権限によるプロンプトの変更
    if (isAdmin) {
        $UserPrompt = "#"
    }else{
        $UserPrompt = "$"
    }

    # Gitのブランチ 表示
    $branch = (git branch|findstr "*")
    if ($branch){
        $branch = "[  " + (git branch|findstr "*").replace("* ","") + " ]"
    }

    if ($HiddenUserName -ne $true){
        Write-Host "${env:username}" -NoNewline -ForegroundColor Green
        Write-Host ":" -NoNewline -ForegroundColor White
    }

    Write-Host "${currentPath}" -NoNewline -ForegroundColor Blue
    Write-Host "${branch}" -NoNewline -ForegroundColor DarkGreen
    Write-Host "${UserPrompt}" -NoNewline -ForegroundColor White

    return " "
}
