---
external help file: CloudiQ-help.xml
Module Name: CloudiQ
online version:
schema: 2.0.0
---

# Get-CloudiQSubscription

## SYNOPSIS
Get all subscriptions.

## SYNTAX

```
Get-CloudiQSubscription [[-Name] <String>] [[-SubscriptionId] <String>] [[-OrganizationName] <String>]
 [[-OrganizationId] <Int32>] [[-PublisherSubscriptionId] <String>] [-Detailed] [<CommonParameters>]
```

## DESCRIPTION
Get all subscriptions, from all organizations that the user has access to.
It's possible to define the organization name or ID, product name, the subscription id from the portal, and the unique subscription id to narrow down the results or find a specific subscription.

## EXAMPLES

### EXAMPLE 1
```
Get-CloudiQSubscription
```

### EXAMPLE 2
```
# Supports Wildcards
Get-CloudiQSubscription -Name "*E1*"
```

### EXAMPLE 3
```
Get-CloudiQSubscription -PublisherSubscriptionId "fb916799-90cb-4e8c-a796-301bf0765205"
```

### EXAMPLE 4
```
Get-CloudiQSubscription -OrganizationName Company
```

### EXAMPLE 5
```
Get-CloudiQSubscription -OrganizationId 12345
```

## PARAMETERS

### -Name
The name of the subscription.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SubscriptionId
The ID of the subscription.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -OrganizationName
Name of the organization you want to see the current subscriptions for.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -OrganizationId
Organization Id, to limit the subscriptions to certain organizations.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -PublisherSubscriptionId
The subscription Id from the portal.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Detailed
{{ Fill Detailed Description }}

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### Can either use the parameters Name or OrganizationId, or pipe any number of OrganizationId to the cmdlet.
## OUTPUTS

### Outputs a PSCustomObject.
## NOTES

## RELATED LINKS
