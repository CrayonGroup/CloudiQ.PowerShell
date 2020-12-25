---
external help file: CloudiQ-help.xml
Module Name: CloudiQ
online version:
schema: 2.0.0
---

# Get-CloudiQUser

## SYNOPSIS
Get Cloud-iQ users.

## SYNTAX

### allUsers (Default)
```
Get-CloudiQUser [-role <String>] [-Detailed] [<CommonParameters>]
```

### Username
```
Get-CloudiQUser [[-Username] <String>] [-Detailed] [<CommonParameters>]
```

### Id
```
Get-CloudiQUser [[-Id] <String>] [-Detailed] [<CommonParameters>]
```

## DESCRIPTION
Get all, or a specific user from Cloud-iQ.

## EXAMPLES

### EXAMPLE 1
```
Get-CloudiQUser
```

### EXAMPLE 2
```
Get-CloudiQUser -Username user.name@cloudiq.crayon.com
```

## PARAMETERS

### -Username
The username of a particular user.

```yaml
Type: String
Parameter Sets: Username
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Id
The GUID of a particular user.

```yaml
Type: String
Parameter Sets: Id
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -role
Used to filter out users based on role.
Alternatives are admin or user, and defaults to "none" which shows all users.

```yaml
Type: String
Parameter Sets: allUsers
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Detailed
Shows a more detailed view than the default one.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None, for all users. Either Id or Username to filter out users.
## OUTPUTS

### Outputs a PSCustomObject.
## NOTES

## RELATED LINKS
