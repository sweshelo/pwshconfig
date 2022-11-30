oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\M365Princess.omp.json" | Invoke-Expression

set-alias la get-childitem
set-alias touch new-item
set-alias open C:\Windows\explorer.exe
