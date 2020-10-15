function Get-CloudiQSubscription {
    <#
    .SYNOPSIS
    Get all subscriptions.

    .DESCRIPTION
    Get all subscriptions, from all organizations that the user has access to. It's possible to define the organization ID or name to narrow down the results.

    .PARAMETER Name
    The name of the subscription.

    .PARAMETER SubscriptionId
    The ID of the subscription.

    .PARAMETER OrganizationId
    Organization Id, to limit the subscriptions to certain organizations.

    .PARAMETER OrganizationName
    Name of the organization you want to see the current subscriptions for.

    .INPUTS
    Can either use the parameters Name or OrganizationId, or pipe any number of OrganizationId to the cmdlet.

    .OUTPUTS
    Outputs a PSCustomObject.

    .EXAMPLE
    Get-CloudiQSubscription

    .EXAMPLE
    Get-CloudiQSubscription -Name "*E1*"
    # Supports Wildcards

    .EXAMPLE
    Get-CloudiQSubscription -OrganizationName Company

    .EXAMPLE
    Get-CloudiQSubscription -OrganizationId *******

    #>
    [CmdletBinding()]
    param (
        [Parameter(Position = 0)]
        [string]
        $Name,
        [Parameter(Position = 1)]
        [string]
        $SubscriptionId,
        [Parameter(Position = 2)]
        [string]
        $OrganizationName,
        [Parameter(Position = 3)]
        [int]
        $OrganizationId
    )

    # Depending on how we want to access subscriptions, Invoke-CloudiQApiRequest appropriatly
    if ($OrganizationName) {
        try {
            $OrganizationId = Get-CloudiQOrganization -Name $OrganizationName -ErrorAction Stop | Select-object -ExpandProperty Id
        }
        catch {
            Write-Error $_.Exception.Message
            break
        }
        $APICall = Invoke-CloudiQApiRequest -Uri "subscriptions/?organizationID=$OrganizationId" | Select-Object -ExpandProperty Items
    }
    elseif ($SubscriptionId) {
        $APICall = Invoke-CloudiQApiRequest -Uri ("subscriptions/" + $SubscriptionId)
    }
    else {
        $APICall = Invoke-CloudiQApiRequest -Uri "subscriptions" | Select-Object -ExpandProperty Items
    }

    $result = $APICall | ForEach-Object {
        [PSCustomObject]@{
            Publisher      = $_.publisher.name
            Product        = $_.Name
            ProductId      = $_.Product.Id
            SubscriptionId = $_.EntitlementId
            Quantity       = $_.Quantity
            Organization   = $_.Organization.Name
        }
    }
    if ($Name) {
        $result = $result | Where-Object -Property Product -like $Name
        # Send warning if there are no results
        if (!$result) {
            Write-Warning ("No subscriptions found with that name. Are you sure you meant " + $Name + "?")
        }
    }
    return $result | Sort-Object -Property 'Product'
}