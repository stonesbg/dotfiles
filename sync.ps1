# Enable Chocolatey and my script execution without being blocked
Set-ExecutionPolicy Unrestricted

if (!(Test-Path $env:USERPROFILE\Documents\WindowsPowerShell)) {
  mkdir $env:USERPROFILE\Documents\WindowsPowerShell
}

Set-PSRepository -Name PSGallery -InstallationPolicy Trusted

# Load Modules for terminal
$modules = @(
  "PSReadline",
  "Get-ChildItemColor",
  "posh-git",
  "oh-my-posh",
  "z"
)
$modules | Foreach-Object {
  Install-Module -Name $_ -Scope CurrentUser -AllowClobber
}

Copy-Item windows\Documents\PowerShell\profile.ps1 $env:USERPROFILE\Documents\WindowsPowerShell\profile.ps1
Copy-Item windows\Documents\PowerShell\profile.ps1 $env:USERPROFILE\OneDrive\Documents\WindowsPowerShell\profile.ps1

# Laoding in other extra tools
$modules = @(
  "PSScriptAnalyzer"
)
$modules | Foreach-Object {
  Install-Module -Name $_ -Scope CurrentUser -AllowClobber
} 