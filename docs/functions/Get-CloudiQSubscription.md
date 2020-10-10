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
 [[-OrganizationId] <Int32>] [<CommonParameters>]
```

## DESCRIPTION
Get all subscriptions, from all organizations that the user has access to.
It's possible to define the organization ID or name to narrow down the results.

## EXAMPLES

### EXAMPLE 1
```
Get-CloudiQSubscription
```

### EXAMPLE 2
```
Get-CloudiQSubscription -OrganizationName Company
```

### EXAMPLE 3
```
Get-CloudiQSubscription -OrganizationId *******
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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### Can either use the parameters Name or OrganizationId, or pipe any number of OrganizationId to the cmdlet.
## OUTPUTS

### Outputs a PSCustomObject.
## NOTES

## RELATED LINKS
