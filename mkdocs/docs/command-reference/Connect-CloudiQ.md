---
external help file: CloudiQ-help.xml
Module Name: CloudiQ
online version:
schema: 2.0.0
---

# Connect-CloudiQ

## SYNOPSIS
Connect to CloudiQ and adds API token to your session.

## SYNTAX

```
Connect-CloudiQ [[-ClientId] <String>] [[-ClientSecret] <String>] [<CommonParameters>]
```

## DESCRIPTION
Connect to CloudiQ by using a client id and secret created in the portal, as well as your username and password.

## EXAMPLES

### EXAMPLE 1
```
Connect-CloudiQ -ClientId xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx -ClientSecret xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
```

## PARAMETERS

### -ClientId
Client Id from the portal, created under API Management

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

### -ClientSecret
Client Secret from the portal, created under API Management

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### Client ID and Secret, as well as username and password.
## OUTPUTS

### No output, adds API token to your current session.
## NOTES

## RELATED LINKS
