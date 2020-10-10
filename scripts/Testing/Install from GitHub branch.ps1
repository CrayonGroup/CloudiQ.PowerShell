$branch = "master"

Set-PSRepository PSGallery -InstallationPolicy Trusted

if ($PSVersionTable.PSVersion.Major -le 5) {
    Install-Module -Name Pester -Scope CurrentUser -Confirm:$false -Force
    Remove-Module Pester
    Import-Module Pester
}
else {
    Install-Module -Name Pester -Scope CurrentUser -Confirm:$false -Force
    Import-Module Pester
}

$file = @{
    Uri = "https://github.com/CrayonAS/CloudiQ.PowerShell/archive/$branch.zip"
    OutFile = 'cloudiq.zip'
}

Invoke-WebRequest @file

Expand-Archive -Path cloudiq.zip -DestinationPath .

Set-Location CloudiQ.PowerShell*

Invoke-Pester tests -Output Detailed

Import-Module .\CloudiQ\CloudiQ.psd1