function Invoke-CloudiQApiRequest($uri) {}
Mock Invoke-CloudiQApiRequest {
    [PSCustomObject]@{
        Items = @{
            Id                     = 82049
            Organization           = @{
                Id   = 1234567
                Name = 'Crayon'
            }
            Name                   = 'Microsoft CSP Perpetual Software'
            SalesPriceCurrencyCode = 'NOK'
            StartDate              = '2020-09-01 02:00:00'
            EndDate                = '9999-12-31 23:59:59'
            Disabled               = $False
            Publisher              = @{
                Id   = 2
                Name = 'Microsoft'
            }
            Program                = @{
                Id   = 8
                Name = 'CSP'
            }
            Number                 = '-'
            CustomerNumber         = $null
            MasterAgreement        = $null
            HasTerms               = $False
            AgreementType          = 7
            ParentAgreementId      = $null
            CommitmentLevel        = 0
            ConsumerId             = 0
        }
    }

    [PSCustomObject]@{
        Items = @{
            Id                     = 15724
            Organization           = @{
                Id   = 1234567
                Name = 'Crayon'
            }
            Name                   = 'Microsoft CSP Perpetual Software'
            SalesPriceCurrencyCode = 'NOK'
            StartDate              = '2020-09-01 02:00:00'
            EndDate                = '9999-12-31 23:59:59'
            Disabled               = $False
            Publisher              = @{
                Id   = 2
                Name = 'Microsoft'
            }
            Program                = @{
                Id   = 8
                Name = 'CSP'
            }
            Number                 = '-'
            CustomerNumber         = $null
            MasterAgreement        = $null
            HasTerms               = $False
            AgreementType          = 7
            ParentAgreementId      = $null
            CommitmentLevel        = 0
            ConsumerId             = 0
        }
    }
}

