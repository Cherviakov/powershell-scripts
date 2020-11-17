$pversion = Get-Host | Select-Object Version
$pversion = $pversion.Version
if ([Version]$pversion -lt [Version]"6.0.0") {
  Write-Host "Powershell version must be >= 6.0.0"
  Write-Host 'Use following script to install latest version: iex "& {$(irm https://aka.ms/install-powershell.ps1)} -UseMSI"'
  Write-Host "Or download and install manually from url like https://github.com/PowerShell/releases/download/v7.1.0/PowerShell-7.1.0-win=x64.msi"
  exit
}
