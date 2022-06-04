---
external help file: posh-Brawl-help.xml
Module Name: Posh-Brawl
online version:
schema: 2.0.0
---

# Get-PowerPlaySeasonID

## SYNOPSIS
Get information about a single player by player tag

## SYNTAX

```
Get-PowerPlaySeasonID [[-CountryCode] <String>] [[-Limit] <Int32>] [[-Date] <String>] [<CommonParameters>]
```

## DESCRIPTION
Get information about a single player by player tag

## EXAMPLES

### EXAMPLE 1
```
Get-PowerPlaySeasonID -Limit 5
```

id startDate  endDate
   -- ---------  -------
   56 10-28-2019 11-11-2019
   57 11-11-2019 11-25-2019
   58 11-25-2019 12-09-2019
   59 12-09-2019 12-23-2019
   60 12-23-2019 01-06-2020

### EXAMPLE 2
```
Get-PowerPlaySeasonID -CountryCode US -Date 6-2-2022
```

id  startDate  endDate
   --  ---------  -------
   123 05-23-2022 06-06-2022

## PARAMETERS

### -CountryCode
Type: String
Two letter country code or 'GLOBAL' to query global endpoint

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

### -Date
Date to query in MM-dd-yyyy OR M-d-yyyy format.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
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
