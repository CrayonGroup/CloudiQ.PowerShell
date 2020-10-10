BeforeAll {
    # Import module
    Import-Module -Name "$PSScriptRoot/../CloudiQ/CloudiQ.psd1" -Force -ErrorAction Stop
    . "$PSScriptRoot/mocks/organizations.ps1"
    . "$PSScriptRoot/mocks/subscriptions.ps1"
}

Describe 'get subscription tests' {

    It 'Should result in all available subscriptions' {
        $subscriptions = Get-CloudiQSubscription
        $subscriptions.count | Should -Be 5
        $subscriptions.organization | Select-Object -Unique | Sort-Object | Should -be 'Demo Customer [T1/EUR]','Demo Customer [T1/USD]'
    }

    It 'should filter out just the subscriptions from the customer named T1/EUR' {
        $subscription = Get-CloudiQSubscription -OrganizationName "T1/EUR"
        $subscription.count | Should -Be 1
    }

    It 'Should get the one subscription with ID of 12345' {
        $subscription = Get-CloudiQSubscription -SubscriptionId 12345
        $subscription.count | Should -Be 1
        $subscription.Product | Should -Be 'Microsoft 365 E3'
        $subscription.ProductId | Should -Be 67226
        $subscription.quantity | Should -Be 21
        $subscription.organization | Should -Be 'Demo Customer [T1/EUR]'
    }
}