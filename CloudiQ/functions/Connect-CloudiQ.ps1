function Connect-CloudiQ {
    <#
    .SYNOPSIS

    Connect to CloudiQ and adds API token to your session.

    .DESCRIPTION

    Connect to CloudiQ by using a client id and secret created in the portal, as well as your username and password.

    .PARAMETER ClientId

    Client Id from the portal, created under API Management

    .PARAMETER ClientSecret

    Client Secret from the portal, created under API Management

    .INPUTS

    .OUTPUTS

    No output, adds API token to your current session.

    .EXAMPLE
    Connect-CloudiQ -ClientId xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx -ClientSecret xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
    #>
    [CmdletBinding()]
    param (
        [Parameter()]
        [string]
        $ClientId,
        [Parameter()]
        [string]
        $ClientSecret
    )

    if (Test-Path -Path 'Env:\CloudiQClientId') {
        Set-Variable -Name ClientId -Value $Env:CloudiQClientId -Visibility Private
        Set-Variable -Name ClientSecret -Value $Env:CloudiQClientSecret -Visibility Private
    }
    
    $apiBaseUrl = 'https://api.crayon.com/api/v1'
    
    $headers = @{}
    $Bytes = [System.Text.Encoding]::UTF8.GetBytes($ClientId + ":" + $ClientSecret)
    $EncodedText =[Convert]::ToBase64String($Bytes)
    
    # Check if username and password is set as environment variables. If not, ask for username and password.
    if (Test-Path -Path 'Env:\CloudiQUsername') {
        Set-Variable -Name Username -Value $Env:CloudiQUsername
        Set-Variable -Name Password -Value $Env:CloudiQPassword -Visibility Private -Scope Private
    }
    else {
        $username = Read-Host -Prompt "Username"
        $password = Read-Host -Prompt "Password" -AsSecureString
        # Converting from SecureString, the hard way due to limitations in Windows PowerShell
        Set-Variable -Name BSTR -Value ([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($password))  -Visibility Private -Scope Private
        Set-Variable -Name Password -Value ([System.Runtime.InteropServices.Marshal]::PtrToStringBSTR($BSTR))  -Visibility Private -Scope Private
    }
    $Body = @{
        'username'= $username
        'password'= $password
        'grant_type'="password"
        'scope'="CustomerApi"
    }
    
    $headers.Add("Authorization", "Basic "+$EncodedText)
    $headers.Add("Content-Type", "application/x-www-form-urlencoded")
    
    try {
        $OAuthReq = Invoke-RestMethod -Method Post -Uri $apiBaseUrl/connect/token/ -Body $Body -Headers $headers 
    }
    catch {
        Write-Error $_.Exception.Message
        break
    }
    # Add the authentication token to the variable that will be used by the other functions
    New-Variable -Name CloudIqAccessToken -Value $OAuthReq.accesstoken -Scope Global -Force

    Write-Host "Successfully connected to Cloud-iQ" -ForegroundColor Green
}