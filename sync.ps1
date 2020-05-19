# Enable Chocolatey and my script execution without being blocked
Set-ExecutionPolicy Unrestricted

Set-PSRepository -Name PSGallery -InstallationPolicy Trusted

if($PSVersionTable.PSVersion.Major -lt 7) {
  # Nuget Command doesn't apear to run on PowerShell 7
  Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
}

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

Copy-Item windows\Documents\PowerShell\profile.ps1 $profile:CurrentUserAllHosts
