function Invoke-CloudiQApiRequest {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, Position = 0)]
        [string]
        $Uri,
        [Parameter(Position = 1)]
        [string]
        $Method = "GET",
        [Parameter(Position = 2)]
        $Body,
        [Parameter(Position = 3)]
        [switch]
        $AsJson
    )
    try {
        Write-Verbose -Message "Calling Cloud-iQ API"
        $restSplat = @{
            Uri         = "https://apiv1.crayon.com/api/v1/$Uri"
            Method      = $Method
            ContentType = 'application/json'
            Headers     = @{
                'Accept'        = 'application/json'
                'Authorization' = "Bearer $CloudIqAccessToken"
            }
        }
        # If statement to include $Body.
        # Due to limitations in Invoke-RestMethod on Windows PowerShell, we have to define the JSON depth.
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

    Write-Verbose -Message "API results returned, either as object or JSON."
    switch ($AsJson) {
        $true {
            $result | ConvertTo-Json
        }
        Default {
            $result
        }
    }
}