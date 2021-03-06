function Get-CloudiQSubscriptionAddon {
    <#
    .SYNOPSIS
    Get the available subscription addon offers.

    .DESCRIPTION
    Using the parameter SubscriptionId, you can see the subscription addons that are available for that particular subscription.

    In the future, it will return a collection of subscription addon offers that are available for all the subscriptions you have available.

    .PARAMETER SubscriptionId
    The ID for the subscription that you want to check current addons for.

    .INPUTS
    None, or parameters.

    .OUTPUTS
    Outputs a PSCustomObject.

    .EXAMPLE
    Get-CloudiQSubscriptionAddon -SubscriptionId 12345
    #>

    [CmdletBinding()]
    param (
        [Parameter(Position = 0, ValueFromPipeline = $true, Mandatory = $true)]
        [string]
        $SubscriptionId
    )

    $callParam = @{
        Uri = ("subscriptions/$SubscriptionId/addon-offers")
    }

    Write-Debug -Message "Calling API with for subscription $SubscriptionId"
    $APICall = Invoke-CloudiQApiRequest @callParam |
    Select-Object -ExpandProperty Items

    switch ($APICall) {
        $null {
            Write-Information -MessageData "No addons found for subscription $SubscriptionId"
        }
        Default {
            $APICall | ForEach-Object {
                [PSCustomObject]@{
                    Name               = $_.Product.ItemName
                    Id                 = $_.Product.Id
                    Publisher          = $_.Publisher.Name
                    PartNumber         = $_.Product.PartNumber
                    PublisherProductId = $_.Product.PublisherProductId
                }
            }
        }
    }
}