---
external help file: posh-Brawl-help.xml
Module Name: Posh-Brawl
online version:
schema: 2.0.0
---

# Get-ClubRanking

## SYNOPSIS
Get information about a single player by player tag

## SYNTAX

```
Get-ClubRanking [[-CountryCode] <String>] [[-Limit] <Int32>] [-Global] [<CommonParameters>]
```

## DESCRIPTION
Get information about a single player by player tag

## EXAMPLES

### EXAMPLE 1
```
Get-ClubRanking
   tag         : #2GUU9908V
   name        : BC*|Family*
   badgeId     : 8000006
   trophies    : 1504063
   rank        : 1
   memberCount : 30
```

tag         : #P8PV2YU9
   name        : Game.Tv ITA
   badgeId     : 8000055
   trophies    : 1474250
   rank        : 2
   memberCount : 30

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
Accept pipeline input: True (ByValue)
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
Global endpoint

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
