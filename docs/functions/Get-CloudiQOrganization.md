---
external help file: CloudiQ-help.xml
Module Name: CloudiQ
online version:
schema: 2.0.0
---

# Get-CloudiQOrganization

## SYNOPSIS
Get all organizations that you have access to.

## SYNTAX

```
Get-CloudiQOrganization [[-Name] <String>] [<CommonParameters>]
```

## DESCRIPTION
Get all the organizations that are available to you, and presents them as objects.

## EXAMPLES

### EXAMPLE 1
```
Get-CloudiQOrganization
```

### EXAMPLE 2
```
Get-CloudiQOrganization -Name "Organization01"
```

## PARAMETERS

### -Name
Name of the organization you want.
Supports partial names, no wildcard needed.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### Outputs a PSCustomObject.
## NOTES

## RELATED LINKS
