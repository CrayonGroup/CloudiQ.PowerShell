# ------------- Cloud-iQ ------------- #
# Dot sourcing all available functions #
$functionTypes = @(
    '/'
    '/organization/'
    '/subscription/'
)

foreach ($function in $functionTypes) {
    Get-ChildItem -Name "*.ps1" -Path ($PSScriptRoot + "/functions" + $function) | ForEach-Object {
        . ($PSScriptRoot + "/functions" + $function + $_)
    }
}

# Setting alias #
New-Alias -Name 'ciq' -Value 'Connect-CloudiQ' -Description 'Connect to Cloud-iQ'
New-Alias -Name 'giqo' -Value 'Get-CloudiQOrganization' -Description 'Get organizations'
New-Alias -Name 'giqs' -Value 'Get-CloudiQSubscription' -Description 'Get subscriptions'
New-Alias -Name 'siqs' -Value 'Set-CloudiQSubscription' -Description 'Update subscription'