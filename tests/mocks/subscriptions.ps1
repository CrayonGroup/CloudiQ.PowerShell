function Invoke-CloudiQApiRequest() {
    [CmdletBinding()]
    param (
        [Parameter(Position = 0, ValueFromPipeline = $true, Mandatory = $true)]
        [string]
        $SubscriptionId,
        [Parameter(Position = 1)]
        [int]
        $Add,
        [Parameter(Position = 2)]
        [int]
        $Subtract,
        [Parameter(Position = 1)]
        [int]
        $Quantity
    )
}
Mock Invoke-CloudiQApiRequest {
    [PSCustomObject]@{
        Items = @{
            Publisher    = @{Name = "Microsoft" }
            Name         = 'Microsoft 365 E3'
            Product      = @{Id = '67226' }
            Id           = '12345'
            Quantity     = '21'
            Organization = @{Name = 'Demo Customer [T1/EUR]' }
        }
    }
    [PSCustomObject]@{
        Items = @{
            Publisher    = @{Name = "Microsoft" }
            Name         = 'Microsoft 365 E1'
            Product      = @{Id = '67224' }
            Id           = '23456'
            Quantity     = '38'
            Organization = @{Name = 'Demo Customer [T1/EUR]' }
        }
    }
    [PSCustomObject]@{
        Items = @{
            Publisher    = @{Name = "Microsoft" }
            Name         = 'Microsoft 365 F1'
            Product      = @{Id = '67225' }
            Id           = '34567'
            Quantity     = '198'
            Organization = @{Name = 'Demo Customer [T1/EUR]' }
        }
    }
    [PSCustomObject]@{
        Items = @{
            Publisher    = @{Name = "Microsoft" }
            Name         = 'Microsoft 365 E1'
            Product      = @{Id = '67224' }
            Id           = '10010'
            Quantity     = '1948'
            Organization = @{Name = 'Demo Customer [T1/USD]' }
        }
    }
    [PSCustomObject]@{
        Items = @{
            Publisher    = @{Name = "Microsoft" }
            Name         = 'Microsoft 365 F1'
            Product      = @{Id = '67225' }
            Id           = '10011'
            Quantity     = '249'
            Organization = @{Name = 'Demo Customer [T1/USD]' }
        }
    }
} -ParameterFilter { $Uri -Eq "subscriptions" }
# Mock getting subscriptions from a particular customer, based on the parameter OrganizationName
Mock Invoke-CloudiQApiRequest {
    [PSCustomObject]@{
        Items = @{
            Publisher    = @{Name = "Microsoft" }
            Name         = 'Microsoft 365 E3'
            Product      = @{Id = '67226' }
            Id           = '12345'
            Quantity     = '21'
            Organization = @{Name = 'Demo Customer [T1/EUR]' }
        }
    }
} -ParameterFilter { $Uri -Eq 'subscriptions/?organizationID=4013280' }
# Mock a specific subscription by using the subscription Id
Mock Invoke-CloudiQApiRequest {
    [PSCustomObject]@{
        Publisher    = @{Name = "Microsoft" }
        Name         = 'Microsoft 365 E3'
        Product      = @{Id = '67226' }
        Id           = '12345'
        Quantity     = '21'
        Organization = @{Name = 'Demo Customer [T1/EUR]' }
    }
} -ParameterFilter { $Uri -Eq 'subscriptions/12345' }
# Mock a spesific response for updating subscription count
Mock Invoke-CloudiQApiRequest {
    return [PSCustomObject]@{
        Name            = 'Microsoft 365 E3'
        Id              = 12345
        OldQuantity     = 21
        NewQuantity     = ($Body | ConvertFrom-Json | Select-Object -ExpandProperty Quantity)
    }
} -ParameterFilter { $Body -and $Uri -Eq 'subscriptions/12345' -and $method -Like "PUT" }