function Get-CloudiQUser {
    <#
    .SYNOPSIS
    Get Cloud-iQ users.

    .DESCRIPTION
    Get all, or a specific user from Cloud-iQ.

    .PARAMETER Username
    The username of a particular user.

    .PARAMETER Id
    The GUID of a particular user.

    .PARAMETER Role
    Used to filter out users based on role. Alternatives are admin or user, and defaults to "none" which shows all users.

    .PARAMETER Detailed
    Shows a more detailed view than the default one.

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
        $role = 'None',
        [switch]
        $Detailed
    )

    if ($Username) {
        Write-Verbose -Message "Finding the user with the username of " + $username.ToLower()
        $callParam = @{
            Uri = "users/user/?userName=$Username"
        }
    }
    elseif ($Id) {
        Write-Verbose -Message "Finding the user with an Id of $Id"
        $callParam = @{
            Uri = "users/?userId=$Id"
        }
    } 
    else {
        Write-Verbose -Message ("Finding all users with the " + $role.ToLower() + " role")
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