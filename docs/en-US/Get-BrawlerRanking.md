---
external help file: posh-Brawl-help.xml
Module Name: Posh-Brawl
online version:
schema: 2.0.0
---

# Get-BrawlerRanking

## SYNOPSIS
Get brawler rankings for a country or global ranking.

## SYNTAX

### Global (Default)
```
Get-BrawlerRanking [-Limit <Int32>] -BrawlerID <Int32> [-Global] [<CommonParameters>]
```

### CountryCode
```
Get-BrawlerRanking [-CountryCode <String>] [-Limit <Int32>] -BrawlerID <Int32> [<CommonParameters>]
```

## DESCRIPTION
Get brawler rankings for a country or global rankings.
Brawler identifiers can be found by using the /v1/brawlers API endpoint.

## EXAMPLES

### EXAMPLE 1
```
Get-BrawlerRanking -BrawlerID 16000011 -Limit 1
```

tag       : #20288898G
   name      : ☔︎LT|Rayy-Nex☔︎
   nameColor : 0xffffffff
   icon      : @{id=28000014}
   trophies  : 1270
   rank      : 1
   club      : @{name=ReVant}

### EXAMPLE 2
```
Get-Brawler -Name Shelly | Get-BrawlerRanking
```

### EXAMPLE 3
```
16000012 | Get-BrawlerRanking
```

### EXAMPLE 4
```
16000013 | Get-BrawlerRanking -Limit 1
```

## PARAMETERS

### -CountryCode
Type: String
Two letter country code

```yaml
Type: String
Parameter Sets: CountryCode
Aliases:

Required: False
Position: Named
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
Position: Named
Default value: 200
Accept pipeline input: False
Accept wildcard characters: False
```

### -BrawlerID
Type: INT
Alias: ID
Identifier of the brawler.
Can be queried using Get-Brawler

```yaml
Type: Int32
Parameter Sets: (All)
Aliases: ID

Required: True
Position: Named
Default value: 0
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -Global
Type: Switch
This parameter forces checking the Global endpoint

```yaml
Type: SwitchParameter
Parameter Sets: Global
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
To do: This endpoint supports before and after query strings, need to add logic and parameter sets
to support this scenario.

## RELATED LINKS
