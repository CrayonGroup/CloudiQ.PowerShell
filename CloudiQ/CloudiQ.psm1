# ------------- Cloud-iQ ------------- #
# Dot sourcing all available functions #
$functionTypes = @(
    '/'
    '/organization/'
    '/agreement/'
    '/subscription/'
    '/user/'
)

foreach ($function in $functionTypes) {
    Get-ChildItem -Name "*.ps1" -Path ($PSScriptRoot + "/functions" + $function) | ForEach-Object {
        . ($PSScriptRoot + "/functions" + $function + $_)
    }
}

New-Alias -Name 'ciqc' -Value 'Connect-CloudiQ' -Description 'Connect to Cloud-iQ'
# Organization
New-Alias -Name 'ciqgo' -Value 'Get-CloudiQOrganization' -Description 'Get organizations'
# Agreement
New-Alias -Name 'ciqa' -Value 'Get-CloudiQAgreement' -Description 'Get agreements'
New-Alias -Name 'ciqap' -Value 'Get-CloudiQAgreementProduct' -Description 'Get agreement products'
# Subscription
New-Alias -Name 'ciqgs' -Value 'Get-CloudiQSubscription' -Description 'Get subscriptions'
New-Alias -Name 'ciqss' -Value 'Set-CloudiQSubscription' -Description 'Update subscription'
# Subscription Addon
New-Alias -Name 'ciqgsa' -Value 'Get-CloudiQSubscriptionAddon'
New-Alias -Name 'ciqssa' -Value 'Set-CloudiQSubscriptionAddon'
# User management
New-Alias -Name 'ciqgu' -Value 'Get-CloudiQUser' -Description 'Get Cloud-iQ users'
New-Alias -Name 'ciqnu' -Value 'New-CloudiQUser' -Description 'Create a new Cloud-iQ user'
New-Alias -Name 'ciqsu' -Value 'Set-CloudiQUser' -Description 'Update a Cloud-iQ user'
New-Alias -Name 'ciqru' -Value 'Remove-CloudiQUser' -Description 'Remove a Cloud-iQ user'
New-Alias -Name 'ciqsup' -Value 'Set-CloudiQUserPassword' -Description 'Update a Cloud-iQ user password'