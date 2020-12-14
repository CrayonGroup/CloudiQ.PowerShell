# ------------- Cloud-iQ ------------- #
# Dot sourcing all available functions #
$functionTypes = @(
    '/'
    '/organization/'
    '/agreement/'
    '/subscription/'
)

foreach ($function in $functionTypes) {
    Get-ChildItem -Name "*.ps1" -Path ($PSScriptRoot + "/functions" + $function) | ForEach-Object {
        . ($PSScriptRoot + "/functions" + $function + $_)
    }
}

New-Alias -Name 'ciqc' -Value 'Connect-CloudiQ' -Description 'Connect to Cloud-iQ'
New-Alias -Name 'ciqgo' -Value 'Get-CloudiQOrganization' -Description 'Get organizations'
New-Alias -Name 'ciqa' -Value 'Get-CloudiQAgreement' -Description 'Get agreements'
New-Alias -Name 'ciqap' -Value 'Get-CloudiQAgreementProduct' -Description 'Get agreement products'
New-Alias -Name 'ciqgs' -Value 'Get-CloudiQSubscription' -Description 'Get subscriptions'
New-Alias -Name 'ciqss' -Value 'Set-CloudiQSubscription' -Description 'Update subscription'