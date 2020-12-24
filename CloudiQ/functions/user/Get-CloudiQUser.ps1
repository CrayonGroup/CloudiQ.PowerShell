function Get-CloudiQUser {
    <#
    .SYNOPSIS
    Get Cloud-iQ users.

    .DESCRIPTION
    Get all, or a specific user from Cloud-iQ.

    .PARAMETER Username
    
    .PARAMETER Id
    
    .INPUTS
    None, for all users. Either Id or Username to filter out users.

    .OUTPUTS
    Outputs a PSCustomObject.

    .EXAMPLE
    Get-CloudiQUser
    #>
    [CmdletBinding(DefaultParameterSetName = 'allUsers')]
    param (
        [Parameter(Position = 0,
            ParameterSetName = 'Username')]
        [string]
        $Username,
        [Parameter(Position = 1,
            ParameterSetName = 'Id')]
        [string]
        $Id,
        [Parameter(ParameterSetName = 'allUsers')]
        [ValidateSet('User', 'Admin')]
        [string]
        $role = 'User',
        [switch]
        $Detailed
    )

    if ($Username) {
        $callParam = @{
            Uri = "users/user/?userName=$Username"
        }
    }
    elseif ($Id) {
        $callParam = @{
            Uri = "users/?userId=$Id"
        }
    } 
    else {
        $callParam = @{
            Uri = "users/?role=$role"
        }
    }

    $APICall = Invoke-CloudiQApiRequest @callParam | Select-Object -ExpandProperty Items
    switch ($Detailed) {
        $true { $APICall }
        $false {
            $APICall | ForEach-Object {
                [PSCustomObject]@{
                    Id        = $_.Id
                    FirstName = $_.FirstName
                    LastName  = $_.LastName
                    UserName  = $_.UserName
                    Email     = $_.Email
                }
            }
        }
    }

}