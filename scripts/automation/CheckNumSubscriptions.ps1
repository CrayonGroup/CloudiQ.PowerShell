# CheckNumSubscriptions.ps1
# Minimize overspending by removing subscriptions
# that are not in use.

. ServicePlanSku.ps1

$tenant = Get-AzureADTenantDetail | Select-Object -ExpandProperty ObjectId

$CIQSubs = Get-CloudiQSubscription | Where-Object {$_.Product -ne 'CSP Demo Services'} | Select-Object Product, SubscriptionId, Quantity

$CIQSubs | ForEach-Object {
  # Get the correct SKU for the subscription.
  $Sku = Get-Sku |
  Where-Object -Property Name -eq $_.Product |
  Select-Object -ExpandProperty Sku
  # Get the consumed units from Azure AD
  # with the ObjectId, combination of
  # tenant and product GUID.
  $consumedUnits = Get-AzureADSubscribedSku -ObjectId ($tenant + "_" + $Sku) |
  Select-Object -ExpandProperty ConsumedUnits

  [PSCustomObject]@{
    Product         = $_.Product
    SKU             = $Sku
    SubscribedUnits = $_.Quantity
    ConsumedUnits   = $consumedUnits
  }
  # If consumed units is less then subscribed units, set the quantity of licenses to what is consumed
  if ($consumedUnits -lt $SubscribedUnits) {
    Set-CloudiQSubscription -SubscriptionId $SubscriptionId -Quantity $Consumed
  }
}