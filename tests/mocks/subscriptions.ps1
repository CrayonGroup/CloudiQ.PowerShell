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
            Publisher               = @{Name = "Microsoft" }
            FriendlyName            = 'Microsoft 365 E3'
            PublisherSubscriptionId = '62e7ecc7-f16a-437b-9981-ae47bd0c368c'
            Product                 = @{
                Id       = '67226'
                ItemName = 'Microsoft 365 E3'
            }
            Id                      = '12345'
            Quantity                = '21'
            Organization            = @{Name = 'Demo Customer [T1/EUR]' }
        }
    }
    [PSCustomObject]@{
        Items = @{
            Publisher               = @{Name = "Microsoft" }
            FriendlyName            = 'Microsoft 365 E1'
            PublisherSubscriptionId = '65c90ef8-cf25-45e7-bf8c-94203dd4420e'
            Product                 = @{
                Id       = '67224'
                ItemName = 'Microsoft 365 E1'
            }
            Id                      = '23456'
            Quantity                = '38'
            Organization            = @{Name = 'Demo Customer [T1/EUR]' }
        }
    }
    [PSCustomObject]@{
        Items = @{
            Publisher               = @{Name = "Microsoft" }
            FriendlyName            = 'Microsoft 365 F1'
            PublisherSubscriptionId = 'ba4ee806-f061-4bec-ad40-eaa92ea79d78'
            Product                 = @{
                Id       = '67225'
                ItemName = 'Microsoft 365 F1'
            }
            Id                      = '34567'
            Quantity                = '198'
            Organization            = @{Name = 'Demo Customer [T1/EUR]' }
        }
    }
    [PSCustomObject]@{
        Items = @{
            Publisher               = @{Name = "Microsoft" }
            FriendlyName            = 'Microsoft 365 E1'
            PublisherSubscriptionId = '850a1cd7-8769-4f02-a677-b48c84ac55e9'
            Product                 = @{
                Id       = '67224'
                ItemName = 'Microsoft 365 E1'
            }
            Id                      = '10010'
            Quantity                = '1948'
            Organization            = @{Name = 'Demo Customer [T1/USD]' }
        }
    }
    [PSCustomObject]@{
        Items = @{
            Publisher               = @{Name = "Microsoft" }
            FriendlyName            = 'Microsoft 365 F1'
            PublisherSubscriptionId = 'e2278b5e-b421-4322-8bfe-7add1bc67a8e'
            Product                 = @{
                Id       = '67225'
                ItemName = 'Microsoft 365 F1'
            }
            Id                      = '10011'
            Quantity                = '249'
            Organization            = @{Name = 'Demo Customer [T1/USD]' }
        }
    }
} -ParameterFilter { $Uri -Eq "subscriptions" }
# Mock getting subscriptions from a particular customer, based on the parameter OrganizationName
Mock Invoke-CloudiQApiRequest {
    [PSCustomObject]@{
        Items = @{
            Publisher    = @{Name = "Microsoft" }
            FriendlyName = 'Microsoft 365 E3'
            Product      = @{
                Id       = '67226'
                ItemName = 'Microsoft 365 E3'
            }
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
        FriendlyName = 'Microsoft 365 E3'
        Product      = @{
            Id       = '67226'
            ItemName = 'Microsoft 365 E3'
        }
        Id           = '12345'
        Quantity     = '21'
        Organization = @{Name = 'Demo Customer [T1/EUR]' }
    }
} -ParameterFilter { $Uri -Eq 'subscriptions/12345' }
# Mock a spesific response for updating subscription count
Mock Invoke-CloudiQApiRequest {
    return [PSCustomObject]@{
        Name        = 'Microsoft 365 E3'
        Id          = 12345
        OldQuantity = 21
        NewQuantity = ($Body | ConvertFrom-Json | Select-Object -ExpandProperty Quantity)
    }
} -ParameterFilter { $Body -and $Uri -Eq 'subscriptions/12345' -and $method -Like "PUT" }