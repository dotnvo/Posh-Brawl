---
external help file: posh-Brawl-help.xml
Module Name: Posh-Brawl
online version:
schema: 2.0.0
---

# Test-PowerPlayDate

## SYNOPSIS
Tests to ensure the dates being checked is between the proper dates for powerplay

## SYNTAX

```
Test-PowerPlayDate [[-Date] <Object>] [<CommonParameters>]
```

## DESCRIPTION
Tests to ensure the dates being checked is between the proper dates for powerplay

## EXAMPLES

### EXAMPLE 1
```
Test-PowerPlayDate -Date "$((Get-Date).date)"
```

True

### EXAMPLE 2
```
Test-PowerPlayDate -Date 10/30/2019
```

True

### EXAMPLE 3
```
Test-PowerPlayDate -Date 10/01/2018
```

False

## PARAMETERS

### -Date
Date to query

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
