function Invoke-CloudiQApiRequest {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $True, Position = 0)]
        [string]
        $Uri,
        [Parameter(Position = 1)]
        [string]
        $Method = "Get",
        [Parameter(Position = 2)]
        [string]
        $Body,
        [Parameter(Position = 3)]
        [switch]
        $AsJson
    )
    try {
        $restSplat = @{
            Uri         = "https://apiv1.crayon.com/api/v1/$Uri"
            Method      = $Method
            ContentType = 'application/json'
            Headers     = @{
                'Authorization' = "Bearer $CloudIqAccessToken"
            }
        }
        # If statement to include $Body, due to limitations in Invoke-RestMethod on Windows PowerShell.
        if ($Body) {
            $result = Invoke-RestMethod @restSplat -Body $Body -ErrorAction Stop
        }
        else {
            $result = Invoke-RestMethod @restSplat -ErrorAction Stop
        }
    }
    catch {
        Write-Error $_.Exception.Message
        Write-Warning "There are no access token set. Please run Connect-CloudiQ and log in to generate one."
        break
    }

    if ($AsJson) {
        $result | ConvertTo-Json
    }
    else {
        $result
    }
}