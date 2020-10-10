---
external help file: CloudiQ-help.xml
Module Name: CloudiQ
online version:
schema: 2.0.0
---

# Set-CloudiQSubscription

## SYNOPSIS
Update a subscription based on Subscription ID.

## SYNTAX

```
Set-CloudiQSubscription [-SubscriptionId] <String> [[-Add] <Int32>] [[-Subtract] <Int32>] [[-Quantity] <Int32>]
 [<CommonParameters>]
```

## DESCRIPTION
Update the friendly name, quantity, invoice profile, status and tags of a subscription.

## EXAMPLES

### EXAMPLE 1
```
Set-CloudiQSubscription -SubscriptionId 00000 -Add 1
```

### EXAMPLE 2
```
Set-CloudiQSubscription -SubscriptionId 00000 -Subtract 2
```

### EXAMPLE 3
```
Set-CloudiQSubscription -SubscriptionId 00000 -Quantity 3
```

## PARAMETERS

### -SubscriptionId
Organization Id, to limit the subscriptions to certain organizations.

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

### -Add
{{ Fill Add Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Subtract
{{ Fill Subtract Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Quantity
{{ Fill Quantity Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### Requires an
## OUTPUTS

### Outputs a PSCustomObject.
## NOTES

## RELATED LINKS
