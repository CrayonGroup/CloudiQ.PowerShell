BeforeAll {
    # Import module
    Import-Module -Name "$PSScriptRoot/../CloudiQ/CloudiQ.psd1" -Force -ErrorAction Stop
    . "$PSScriptRoot/mocks/organizations.ps1"
    . "$PSScriptRoot/mocks/subscriptions.ps1"
}
Describe 'subscription tests' {
    Context 'Get-CloudiQSubscription' {
        It 'Should result in all available subscriptions' {
            $subscriptions = Get-CloudiQSubscription
            $subscriptions.count | Should -Be 5
            Should -Invoke 'Invoke-CloudiQApiRequest'
        }
    
        It 'should filter out just the subscriptions from the customer named T1/EUR' {
            $subscription = Get-CloudiQSubscription -OrganizationName "T1/EUR"
            $subscription.count | Should -Be 1
            Should -Invoke 'Invoke-CloudiQApiRequest'
        }
    
        It 'try to find a organization name that is not available' {
            { Get-CloudiQSubscription -OrganizationName "Thing_that_should_not_be" -ErrorAction Stop } | Should -Throw
            Should -Invoke 'Invoke-CloudiQApiRequest'
        }
    
        It 'Should get the one subscription with ID of 12345' {
            $subscription = Get-CloudiQSubscription -SubscriptionId 12345
            $subscription.count | Should -Be 1
            $subscription.ProductName | Should -Be 'Microsoft 365 E3'
            $subscription.quantity | Should -Be 21
            Should -Invoke 'Invoke-CloudiQApiRequest'
        }
    
        It 'should get subscriptions based on name' {
            $subscriptions = Get-CloudiQSubscription -Name "*F1*"
            $subscriptions.count | Should -Be 2
            Should -Invoke 'Invoke-CloudiQApiRequest'
        }
    
        It 'try to find a subscription that is not available' {
            { Get-CloudiQSubscription -Name "Bad name" -ErrorAction Stop } | Should -Throw
            Should -Invoke 'Invoke-CloudiQApiRequest'
        }

        It 'should get subscriptions based on PublisherSubscriptionId' {
            $subscription = Get-CloudiQSubscription -PublisherSubscriptionId "ba4ee806-f061-4bec-ad40-eaa92ea79d78"
            $subscription.count | Should -Be 1
            $subscription.ProductName | Should -Be 'Microsoft 365 F1'
            Should -Invoke 'Invoke-CloudiQApiRequest'
        }

        It 'should fail to get subscriptions based on PublisherSubscriptionId' {
            { Get-CloudiQSubscription -PublisherSubscriptionId "really-bad-guid" -ErrorAction Stop } | Should -Throw
            Should -Invoke 'Invoke-CloudiQApiRequest'
        }
    }
    # TODO: Having issues with nested filters.
    # Context 'Set-CloudiQSubscription' {
    #     Describe 'set subscription tests' {
    #         It 'should add the subscription count by 1' {
    #             $subscription = Set-CloudiQSubscription -SubscriptionId 12345 -Add 1
    
    #             $subscription.oldQuantity | Should -Be 21
    #             $subscription.NewQuantity | Should -Be 22
    #         }
    #     }
    # }
}