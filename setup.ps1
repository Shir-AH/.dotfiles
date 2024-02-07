$DOTFILES = "$HOME\.dotfiles"
# New-Item -Path $HOME\Repositories -ItemType Directory -Force

winget import .\winget\winget.export
New-Item -Path $HOME\.gitconfig -ItemType SymbolicLink -Value .\git\.gitconfig
# New-Item -Path $HOME\AppData\Local\Microsoft\PowerToys -ItemType SymbolicLink -Value .\PowerToys
wsl --install -d Ubuntu


# minecraft setup
$MINECRAFT = "$HOME\AppData\Roaming\.minecraft\"
New-Item -Path $MINECRAFT -ItemType Directory -Force
New-Item -Path $MINECRAFT\saves -ItemType Directory -Force
New-Item -Path $MINECRAFT\resourcepacks -ItemType Directory -Force
New-Item -Path $MINECRAFT -ItemType File -Name "allowed_symlinks.txt"
Write-Output "[prefix]$DOTFILES\minecraft\" > $MINECRAFT\allowed_symlinks.txt
New-Item -Path $MINECRAFT\resourcepacks -ItemType SymbolicLink -Value $DOTFILES\minecraft\resourcepacks
Get-ChildItem $DOTFILES\minecraft\saves | Foreach-Object { 
    New-Item -Path $MINECRAFT\saves\$_.Name -ItemType SymbolicLink -Value $_.FullName
}
