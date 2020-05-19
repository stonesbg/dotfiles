# Enable Chocolatey and my script execution without being blocked
Set-ExecutionPolicy Unrestricted

if (!(Test-Path $env:USERPROFILE\Documents\WindowsPowerShell)) {
  mkdir $env:USERPROFILE\Documents\WindowsPowerShell
}

Set-PSRepository -Name PSGallery -InstallationPolicy Trusted

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