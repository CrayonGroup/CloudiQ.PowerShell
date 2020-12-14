function Get-CloudiQSubscription {
    <#
    .SYNOPSIS
    Get all subscriptions.

    .DESCRIPTION
    Get all subscriptions, from all organizations that the user has access to. It's possible to define the organization name or ID, product name, the subscription id from the portal, and the unique subscription id to narrow down the results or find a specific subscription.

    .PARAMETER Name
    The name of the subscription.

    .PARAMETER SubscriptionId
    The ID of the subscription.

    .PARAMETER OrganizationId
    Organization Id, to limit the subscriptions to certain organizations.

    .PARAMETER OrganizationName
    Name of the organization you want to see the current subscriptions for.

    .PARAMETER PublisherSubscriptionId
    The subscription Id from the portal.

    .INPUTS
    Can either use the parameters Name or OrganizationId, or pipe any number of OrganizationId to the cmdlet.

    .OUTPUTS
    Outputs a PSCustomObject.

    .EXAMPLE
    Get-CloudiQSubscription

    .EXAMPLE
    # Supports Wildcards
    Get-CloudiQSubscription -Name "*E1*"

    .EXAMPLE
    Get-CloudiQSubscription -PublisherSubscriptionId "fb916799-90cb-4e8c-a796-301bf0765205"

    .EXAMPLE
    Get-CloudiQSubscription -OrganizationName Company

    .EXAMPLE
    Get-CloudiQSubscription -OrganizationId 12345

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
        $OrganizationId,
        [Parameter(Position = 4)]
        [string]
        $PublisherSubscriptionId,
        [Parameter(Position = 5)]
        [switch]
        $Detailed
    )

    # Depending on how we want to access subscriptions, Invoke-CloudiQApiRequest appropriatly
    if ($OrganizationName) {
        Write-Debug -Message "Parameter OrganizationName used to get subscriptions."
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
        Write-Debug -Message "Parameter SubscriptionId used to get a specific subscription."
        $APICall = Invoke-CloudiQApiRequest -Uri ("subscriptions/" + $SubscriptionId)
    }
    else {
        Write-Debug -Message "No parameter used to filter results, show all subscriptions available."
        $APICall = Invoke-CloudiQApiRequest -Uri "subscriptions" | Select-Object -ExpandProperty Items
    }

    if ($Detailed -or $PublisherSubscriptionId) {
        $result = $APICall | ForEach-Object {
            [PSCustomObject]@{
                SubscriptionId          = $_.Id
                PublisherSubscriptionId = $_.PublisherSubscriptionId
                Publisher               = $_.publisher.name
                ProductName             = $_.Product.ItemName
                FriendlyName            = $_.Name
                ProductId               = $_.Product.Id
                Quantity                = $_.Quantity
                Organization            = $_.Organization.Name
            }
        }
    }
    else {
        $result = $APICall | ForEach-Object {
            [PSCustomObject]@{
                Publisher      = $_.publisher.name
                ProductName    = $_.Product.ItemName
                SubscriptionId = $_.Id
                Quantity       = $_.Quantity
            }
        }
    }

    if ($Name) {
        Write-Verbose -Message "If the Name parameter is used, filter the results based on that name."
        Write-Debug -Message "Value in Name parameter is set to $Name"
        $result = $result | Where-Object -Property ProductName -like $Name
        # Send warning if there are no results
        if (!$result) {
            Write-Error ("No subscriptions found with that name. Are you sure you meant " + $Name + "?")
        }
    }
    elseif ($PublisherSubscriptionId) {
        $result = $result | Where-Object -Property PublisherSubscriptionId -like $PublisherSubscriptionId
        # Send warning if there are no results
        if (!$result) {
            Write-Error ("No subscriptions found with that Subscription Id. Are you sure you meant " + $PublisherSubscriptionId + "?")
        }
    }
    Write-Verbose -Message "Returning results, sorted by product name."
    return $result | Sort-Object -Property 'ProductName'
}