function Set-CloudiQUser {
    <#
    .SYNOPSIS
    Update information about a Cloud-iQ user.

    .DESCRIPTION
    Update information about a Cloud-iQ user.

    .PARAMETER 

    .INPUTS
    Id or username of a user.

    .OUTPUTS
    Outputs a PSCustomObject.

    .EXAMPLE
    Set-CloudiQUser
    #>
    [CmdletBinding()]
    param (
        [Parameter(Position = 0)]
        [string]
        $Id,
        [Parameter(Position = 1)]
        [string]
        $Username,
        [Parameter(Position = 2)]
        [string]
        $Firstname,
        [Parameter(Position = 3)]
        [string]
        $Lastname,
        [Parameter(Position = 4)]
        [string]
        $Email,
        [Parameter(Position = 5)]
        [Int32]
        $PhoneNumber,
        [Parameter(Position = 6)]
        [switch]
        $LockoutEnabled,
        [Parameter(Position = 7)]
        [string]
        $LockoutEnd,
        [Parameter(Position = 8)]
        [switch]
        $TenantAdmin,
        [Parameter(Position = 9)]
        [switch]
        $NewUsername
    )

    $userObject = Get-CloudiQUser -Id $Id

    if ($Username) {
        Write-Verbose -Message "No Id provided, getting the Id by using the username; $Username"
        $Id = Get-CloudiQUser -Username "roberth.strand@crayon.com" | Select-Object -ExpandProperty Id
    }

    If ($Firstname) {
        Write-Verbose -Message 'Changing firstname'
        $userObject.FirstName = $Firstname
    }
    If ($Lastname) {
        Write-Verbose -Message 'Changing lastname'
        $userObject.LastName = $Lastname
    }
    If ($Email) {
        Write-Verbose -Message 'Changing Email'
        $userObject.Email = $Email
    }
    If ($NewUsername) {
        Write-Verbose -Message 'Changing username'
        $userObject.Username = $NewUsername
    }
    If ($PhoneNumber) {
        Write-Verbose -Message 'Changing phonenumber'
        $userObject.PhoneNumber = $PhoneNumber
    }
    If ($LockoutEnabled) {
        Write-Verbose -Message 'Setting lockout'
        $userObject.LockoutEnabled = $LockoutEnabled
    }
    If ($LockoutEnd) {
        Write-Verbose -Message 'Setting when lockout ends'
        $userObject.LockoutEnd = $LockoutEnd
    }
    If ($TenantAdmin) {
        Write-Verbose -Message 'Setting if user is tenant admin'
        $userObject.TenantAdmin = $TenantAdmin
    }
    $callParam = @{
        Uri     = "users/$Id"
        Method  = 'PUT'
        Body    = $userObject
    }

    try {
        Invoke-CloudiQApiRequest @callParam
    }
    catch {
        Write-Error $_.Exception.Message
        break
    }
}