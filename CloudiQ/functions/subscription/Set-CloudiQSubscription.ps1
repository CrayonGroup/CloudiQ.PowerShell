function Set-CloudiQSubscription {
    <#
    .SYNOPSIS
    Update a subscription based on Subscription ID.

    .DESCRIPTION
    Update the friendly name, quantity, invoice profile, status and tags of a subscription.

    .PARAMETER SubscriptionId
    Organization Id, to limit the subscriptions to certain organizations.

    .PARAMETER Add

    Add a number of subscriptions to the total subscription count

    .PARAMETER Subtract

    Subtract a number of subscriptions to the total subscription count

    .INPUTS

    .OUTPUTS
    Outputs a PSCustomObject.

    .EXAMPLE
    Set-CloudiQSubscription -SubscriptionId 00000 -Add 1

    .EXAMPLE
    Set-CloudiQSubscription -SubscriptionId 00000 -Subtract 2

    .EXAMPLE
    Set-CloudiQSubscription -SubscriptionId 00000 -Quantity 3

    #>
    [CmdletBinding()]
    param (
        [Parameter(Position = 0, ValueFromPipeline = $true, Mandatory = $true)]
        [string]
        $SubscriptionId,
        [Parameter(Position = 1)]
        [int]
        $Add,
        [Parameter(Position = 2)]
        [int]
        $Subtract,
        [Parameter(Position = 1)]
        [int]
        $Quantity
    )
    $subscription = Invoke-CloudiQApiRequest -Uri ("subscriptions/$SubscriptionId")

    $originalQuantity = $subscription.quantity
    
    if ($Add) {
        $subscription.quantity += $Add
    }
    elseif ($Subtract) {
        $subscription.quantity -= $Subtract
    }
    else {
        $subscription.quantity = $Quantity
    }

    $callParam = @{
        Uri     = ("subscriptions/$SubscriptionId")
        Method  = 'PUT'
        Body    = ($subscription)
    }
    $APICall = Invoke-CloudiQApiRequest @callParam

    [PSCustomObject]@{
        Name            = $APICall.name
        Id              = $APICall.Id
        OldQuantity     = $originalQuantity
        NewQuantity     = $APICall.Quantity
    }
}