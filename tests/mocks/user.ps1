function Invoke-CloudiQApiRequest($uri) {}
Mock Invoke-CloudiQApiRequest {
    [PSCustomObject]@{
        Items = @{
            Id                   = 'cf487062-46d9-4793-9afb-273d050bff32'
            UserName             = 'user.name@cloudiq.crayon.com'
            FirstName            = 'Default'
            LastName             = 'User'
            Email                = 'user.name@cloudiq.crayon.com'
            EmailConfirmed       = $false
            LockoutEnabled       = $false
            LockoutEnd           = $null
            PhoneNumber          = $null
            PhoneNumberConfirmed = $false
            TwoFactorEnabled     = $false
            TenantAdmin          = $false
        }
    }
    [PSCustomObject]@{
        Items = @{
            Id                   = 'e44e45d4-9798-4987-8762-6da02de5e3b5'
            UserName             = 'admin.user.name@cloudiq.crayon.com'
            FirstName            = 'Admin'
            LastName             = 'User'
            Email                = 'admin.user.name@cloudiq.crayon.com'
            EmailConfirmed       = $true
            LockoutEnabled       = $false
            LockoutEnd           = $null
            PhoneNumber          = $null
            PhoneNumberConfirmed = $false
            TwoFactorEnabled     = $false
            TenantAdmin          = $true
        }
    }
}

Mock Invoke-CloudiQApiRequest {
    [PSCustomObject]@{
        Items = @{
            Id                   = 'cf487062-46d9-4793-9afb-273d050bff32'
            UserName             = 'user.name@cloudiq.crayon.com'
            FirstName            = 'Default'
            LastName             = 'User'
            Email                = 'user.name@cloudiq.crayon.com'
            EmailConfirmed       = $false
            LockoutEnabled       = $false
            LockoutEnd           = $null
            PhoneNumber          = $null
            PhoneNumberConfirmed = $false
            TwoFactorEnabled     = $false
            TenantAdmin          = $false
        }
    }
} -ParameterFilter { $Uri -eq 'users/?role=User' }

Mock Invoke-CloudiQApiRequest {
    [PSCustomObject]@{
        Items = @{
            Id                   = 'e44e45d4-9798-4987-8762-6da02de5e3b5'
            UserName             = 'admin.user.name@cloudiq.crayon.com'
            FirstName            = 'Admin'
            LastName             = 'User'
            Email                = 'admin.user.name@cloudiq.crayon.com'
            EmailConfirmed       = $true
            LockoutEnabled       = $false
            LockoutEnd           = $null
            PhoneNumber          = $null
            PhoneNumberConfirmed = $false
            TwoFactorEnabled     = $false
            TenantAdmin          = $true
        }
    }
} -ParameterFilter { $Uri -eq 'users/?role=Admin' }

Mock Invoke-CloudiQApiRequest {
    [PSCustomObject]@{
        Id                   = 'e44e45d4-9798-4987-8762-6da02de5e3b5'
        UserName             = 'admin.user.name@cloudiq.crayon.com'
        FirstName            = 'Admin'
        LastName             = 'User'
        Email                = 'admin.user.name@cloudiq.crayon.com'
        EmailConfirmed       = $true
        LockoutEnabled       = $false
        LockoutEnd           = $null
        PhoneNumber          = $null
        PhoneNumberConfirmed = $false
        TwoFactorEnabled     = $false
        TenantAdmin          = $true
    }
} -ParameterFilter { $Uri -eq 'users/user/?userName=admin.user.name@cloudiq.crayon.com' }

Mock Invoke-CloudiQApiRequest {
    [PSCustomObject]@{
        Id                   = 'e44e45d4-9798-4987-8762-6da02de5e3b5'
        UserName             = 'admin.user.name@cloudiq.crayon.com'
        FirstName            = 'Admin'
        LastName             = 'User'
        Email                = 'admin.user.name@cloudiq.crayon.com'
        EmailConfirmed       = $true
        LockoutEnabled       = $false
        LockoutEnd           = $null
        PhoneNumber          = $null
        PhoneNumberConfirmed = $false
        TwoFactorEnabled     = $false
        TenantAdmin          = $true
    }
} -ParameterFilter { $Uri -eq 'users/?userId=e44e45d4-9798-4987-8762-6da02de5e3b5' }