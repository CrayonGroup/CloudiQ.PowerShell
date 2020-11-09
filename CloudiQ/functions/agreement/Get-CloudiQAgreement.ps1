function Get-CloudiQAgreement {
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
        [Parameter(Position = 0)]
        [string]
        $Name,
        [Parameter(Position = 1)]
        [switch]
        $Detailed
    )

    $callParam = @{
        Uri = 'Agreements'
    }

    $APICall = Invoke-CloudiQApiRequest @callParam | Select-Object -ExpandProperty Items

    if ($Detailed) {
        $APICall | ForEach-Object {
            [PSCustomObject]@{
                ID              = $_.Id
                Name            = $_.Name
                Disabled        = $_.Disabled
                AgreementNumber = $_.MasterAgreement
                Publisher       = $_.Publisher.Name
                Program         = $_.Program.Name
                Startdate       = $_.StartDate
                Enddate         = $_.EndDate
                Organization    = [PSCustomObject]@{
                    Name = $_.Organization.Name
                    Id   = $_.Organization.Id
                }
                
            }
        }
    }
    else {
        $APICall | ForEach-Object {
            [PSCustomObject]@{
                ID        = $_.Id
                Name      = $_.Name
                Publisher = $_.Publisher.Name
                Program   = $_.Program.Name
            }
        }
    }

}