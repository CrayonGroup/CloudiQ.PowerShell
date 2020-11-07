function Invoke-CloudiQApiRequest($Uri, $Method) {}
Mock Invoke-CloudiQApiRequest {
    return [PSCustomObject]@{
        Items = [PSCustomObject]@{
            Product = [PSCustomObject]@{
                Id                  = 414578
                PartNumber          = '2828BE95-46BA-4F91-B2FD-0BEF192ECF60'
                PublisherProductId  = $null
                ItemLegalName       = 'Product addon item legal name 1'
                ItemName            = 'Product addon item name 1'
            }
            Publisher = [PSCustomObject]@{
                Id      = 2
                Name    = 'Publisher Name'
            }
        }
    }
} -ParameterFilter { $Uri -Eq 'subscriptions/12345/addon-offers' }

Mock Invoke-CloudiQApiRequest {
    return [PSCustomObject]@{
        Items = @{
            Product = @{
                Id                  = 414578
                PartNumber          = '2828BE95-46BA-4F91-B2FD-0BEF192ECF60'
                PublisherProductId  = $null
                ItemLegalName       = 'Product addon item legal name 1'
                ItemName            = 'Product addon item name 1'
            }
            Publisher = @{
                Id      = 2
                Name    = 'Publisher Name'
            }
        }
    }
} -ParameterFilter { $Uri -Eq 'subscriptions/12345/addon-offers' -and $Method -eq 'GET' }