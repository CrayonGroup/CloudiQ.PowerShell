function Invoke-CloudiQApiRequest {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $True, Position = 0)]
        [string]
        $Uri,
        [Parameter(Position = 1)]
        [string]
        $Method = "Get",
        [Parameter(Position = 2, ValueFromPipeline = $true)]
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
                'Accept'        = 'application/json'
                'Authorization' = "Bearer $CloudIqAccessToken"
            }
        }
        # If statement to include $Body, due to limitations in Invoke-RestMethod on Windows PowerShell.
        if ($Body) {
            $result = Invoke-RestMethod @restSplat -Body ($Body | ConvertTo-Json -Depth 10) -ErrorAction Stop
        }
        else {
            $result = Invoke-RestMethod @restSplat -ErrorAction Stop
        }
    }
    catch {
        Write-Error $_.Exception.Message
        break
    }

    if ($AsJson) {
        $result | ConvertTo-Json
    }
    else {
        $result
    }
}