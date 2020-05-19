# Ensure that Get-ChildItemColor is loaded
Import-Module Get-ChildItemColor

# Set l and ls alias to use the new Get-ChildItemColor cmdlets
Set-Alias l Get-ChildItemColor -Option AllScope
Set-Alias ls Get-ChildItemColorFormatWide -Option AllScope

function .. { Set-Location .. }
function ... { Set-Location .. ; Set-Location .. }
function .... { Set-Location .. ; Set-Location .. ; Set-Location .. }
function ..... { Set-Location .. ; Set-Location .. ; Set-Location .. ; Set-Location .. }
function home { Set-Location $env:USERPROFILE }

# Helper function to show Unicode characters
function U
{
    param
    (
        [int] $Code
    )
 
    if ((0 -le $Code) -and ($Code -le 0xFFFF))
    {
        return [char] $Code
    }
 
    if ((0x10000 -le $Code) -and ($Code -le 0x10FFFF))
    {
        return [char]::ConvertFromUtf32($Code)
    }
 
    throw "Invalid character code $Code"
}

# Ensure posh-git is loaded
Import-Module -Name posh-git

# Ensure oh-my-posh is loaded
Import-Module -Name oh-my-posh

# Set the default prompt theme
Set-Theme paradox