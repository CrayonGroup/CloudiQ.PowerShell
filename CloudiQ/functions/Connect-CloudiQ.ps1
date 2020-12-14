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
    Client ID and Secret, as well as username and password.

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

    if ($ClientId -and $ClientSecret) {
        Write-Verbose -Message "Setting ClientId and ClientSecret parameters to environment variables."
        Write-Debug -Message "ClientId: $ClientId"
        Write-Debug -Message "ClientSecret: $ClientSecret"
        New-Item -Path 'Env:\' -Name CloudiQClientId -Value $ClientId -Force | Out-Null
        New-Item -Path 'Env:\' -Name CloudiQClientSecret -Value $ClientSecret -Force | Out-Null
    }
    
    $apiBaseUrl = 'https://api.crayon.com/api/v1'
    
    $headers = @{}
    $Bytes = [System.Text.Encoding]::UTF8.GetBytes($Env:CloudiQClientId + ":" + $Env:CloudiQClientSecret)
    $EncodedText =[Convert]::ToBase64String($Bytes)
    
    # Check if username and password is set as environment variables. If not, ask for username and password.
    if (!$Env:CloudiQUsername) {
        Write-Debug -Message "No username set as environment variables"
        $username = Read-Host -Prompt "Username"
        $password = Read-Host -Prompt "Password" -AsSecureString

        # Converting from SecureString, the hard way due to limitations in Windows PowerShell
        Set-Variable -Name BSTR -Value ([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($password))  -Visibility Private -Scope Private
        Set-Variable -Name Password -Value ([System.Runtime.InteropServices.Marshal]::PtrToStringBSTR($BSTR))  -Visibility Private -Scope Private
        
        Write-Verbose -Message "Setting username and password as environment variables."
        New-Item -Path 'Env:\' -Name CloudiQUsername -Value $username -Force | Out-Null
        New-Item -Path 'Env:\' -Name CloudiQPassword -Value $Password -Force | Out-Null
    }
    $Body = @{
        'username'= $Env:CloudiQUsername
        'password'= $Env:CloudiQPassword
        'grant_type'="password"
        'scope'="CustomerApi"
    }
    
    $headers.Add("Authorization", "Basic "+$EncodedText)
    $headers.Add("Content-Type", "application/x-www-form-urlencoded")
    
    try {
        Write-Verbose -Message ""
        $callParam = @{
            Uri = "$apiBaseUrl/connect/token/"
            Method = 'POST'
            Body = $Body
            Headers = $headers
        }
        $OAuthReq = Invoke-RestMethod @callParam
    }
    catch {
        Write-Error $_.Exception.Message
        break
    }
    # Add the authentication token to the variable that will be used by the other functions

    New-Variable -Name CloudIqAccessToken -Value $OAuthReq.accesstoken -Scope Global -Force

    Write-Host "Successfully connected to Cloud-iQ" -ForegroundColor Green
}