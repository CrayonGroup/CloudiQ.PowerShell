function Get-CloudiQAgreementProduct {
    <#
    .SYNOPSIS
    

    .DESCRIPTION
    

    .PARAMETER Name
    
    .INPUTS
    

    .OUTPUTS
    Outputs a PSCustomObject.

    .EXAMPLE
    #>
    [CmdletBinding()]
    param (
        [Parameter(Position = 0, Mandatory = $True)]
        [string]
        $AgreementId,
        [Parameter(Position = 1)]
        [switch]
        $Detailed
    )
    
    $filter = @{
        AgreementId = @(
            $AgreementId
        )
        Page = 1
        PageSize = 100
    }
    $callParam = @{
        Uri  = "AgreementProducts"
        Body = $filter | ConvertTo-Json
    }

    Invoke-CloudiQApiRequest @callParam #| Select-Object -ExpandProperty Items
}