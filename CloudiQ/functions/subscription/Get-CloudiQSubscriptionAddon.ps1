function Get-CloudiQSubscriptionAddon {
    <#
    .SYNOPSIS
    Get the available subscription addon offers.

    .DESCRIPTION
    Returns a collection of subscription addon offers that are available for all the subscriptions you have available.

    If using the parameter SubscriptionId, you can see the subscription addons that are available for that particular subscription.
    .PARAMETER SubscriptionId

    .INPUTS
    None, or parameters. It's possible to pipe in subscription IDs.
    .OUTPUTS
    Outputs a PSCustomObject.

    .EXAMPLE
    #>
    [CmdletBinding()]
    param (
        [Parameter(Position = 0, ValueFromPipeline = $true)]
        [string]
        $SubscriptionId
    )

    If ($SubscriptionId) {
        # Logic for getting addons for a specific subscription
        $callParam = @{
            Uri     = ("subscriptions/$SubscriptionId/addon-offers")
        }

        $APICall = Invoke-CloudiQApiRequest @callParam |
        Select-Object -ExpandProperty Items

        $APICall | ForEach-Object {
            [PSCustomObject]@{
                Name                = $_.Product.ItemName
                Id                  = $_.Product.Id
                Publisher           = $_.Publisher.Name
                PartNumber          = $_.Product.PartNumber
                PublisherProductId  = $_.Product.PublisherProductId
            }
        }
    }
    elseif ($SubscriptionId.count -gt 1 ) {

    }
    else {

    }

}