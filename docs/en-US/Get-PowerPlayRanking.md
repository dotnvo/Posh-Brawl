---
external help file: posh-Brawl-help.xml
Module Name: Posh-Brawl
online version:
schema: 2.0.0
---

# Get-PowerPlayRanking

## SYNOPSIS
Coming Soon

## SYNTAX

```
Get-PowerPlayRanking [[-CountryCode] <String>] [[-Limit] <Int32>] [[-Uri] <Uri>] [[-SeasonID] <String>]
 [<CommonParameters>]
```

## DESCRIPTION
Coming Soon

## EXAMPLES

### EXAMPLE 1
```
Get-PowerPlayRanking
```

Coming Soon

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

### -Uri
Probably not needed but URI of endpoint

```yaml
Type: Uri
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: "$script:BaseUri/$script:RankingsEndpoint/Global/powerplay/seasons?limit=$Limit"
Accept pipeline input: False
Accept wildcard characters: False
```

### -SeasonID
ID of Season, found by running Get-PowerPlaySeasonID

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: Latest
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
https://developer.brawlstars.com/#/documentation
GET /rankings/{countryCode}/powerplay/seasons/{seasonId}

## RELATED LINKS
