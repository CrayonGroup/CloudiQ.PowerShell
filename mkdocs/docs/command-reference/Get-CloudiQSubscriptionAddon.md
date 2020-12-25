---
external help file: CloudiQ-help.xml
Module Name: CloudiQ
online version:
schema: 2.0.0
---

# Get-CloudiQSubscriptionAddon

## SYNOPSIS
Get the available subscription addon offers.

## SYNTAX

```
Get-CloudiQSubscriptionAddon [-SubscriptionId] <String> [<CommonParameters>]
```

## DESCRIPTION
Using the parameter SubscriptionId, you can see the subscription addons that are available for that particular subscription.

In the future, it will return a collection of subscription addon offers that are available for all the subscriptions you have available.

## EXAMPLES

### EXAMPLE 1
```
Get-CloudiQSubscriptionAddon -SubscriptionId 12345
```

## PARAMETERS

### -SubscriptionId
The ID for the subscription that you want to check current addons for.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None, or parameters.
## OUTPUTS

### Outputs a PSCustomObject.
## NOTES

## RELATED LINKS
