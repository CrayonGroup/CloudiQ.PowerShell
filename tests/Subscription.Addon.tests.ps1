BeforeAll {
    # Import module
    Import-Module -Name "$PSScriptRoot/../CloudiQ/CloudiQ.psd1" -Force -ErrorAction Stop
    . "$PSScriptRoot/mocks/subscription.addons.ps1"
}

Describe "Get addons available to a specific subscription" {

    It 'Should result in a success, with one addon' {
        $addon = Get-CloudiQSubscriptionAddon -SubscriptionId 12345

        $addon.count | Should -Be 1
        $addon.id | Should -Be 414578
        $addon.name | Should -Be 'Product addon item name 1'
    }
}