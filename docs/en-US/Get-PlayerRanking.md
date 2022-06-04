---
external help file: posh-Brawl-help.xml
Module Name: Posh-Brawl
online version:
schema: 2.0.0
---

# Get-PlayerRanking

## SYNOPSIS
Get player rankings for a country or global rankings.

## SYNTAX

```
Get-PlayerRanking [[-CountryCode] <String>] [[-Limit] <Int32>] [-Global] [<CommonParameters>]
```

## DESCRIPTION
Get player rankings for a country or global rankings.

## EXAMPLES

### EXAMPLE 1
```
Get-PlayerRanking -Limit 1
```

tag       : #YGU20CRG
   name      : VitalShark
   nameColor : 0xffcb5aff
   icon      : @{id=28000029}
   trophies  : 64534
   rank      : 1
   club      : @{name=\<c1\>MERCY\</c\>}

## PARAMETERS

### -CountryCode
Type: String
Two letter country code

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

### -Limit
Type: INT
Default Value: 200
Limit the number of items returned in the response.
Valid value is between 1 and 200

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: 200
Accept pipeline input: False
Accept wildcard characters: False
```

### -Global
Switches context to global endpoint.

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

## OUTPUTS

## NOTES
https://developer.brawlstars.com/#/documentation

## RELATED LINKS
