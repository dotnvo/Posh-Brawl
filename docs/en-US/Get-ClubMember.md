---
external help file: posh-Brawl-help.xml
Module Name: Posh-Brawl
online version:
schema: 2.0.0
---

# Get-ClubMember

## SYNOPSIS
List Club Members

## SYNTAX

```
Get-ClubMember [-ClubTag] <String> [<CommonParameters>]
```

## DESCRIPTION
This function gets a list of club members.

## EXAMPLES

### EXAMPLE 1
```
Get-ClubMember -ClubTag "208UU822P" | Select-Object -First 2
```

tag       : #90QUR2QY
   name      : TQ | RaaFa
   nameColor : 0xfff9c908
   role      : member
   trophies  : 54485
   icon      : @{id=28000038}

   tag       : #VGQ0P2VU
   name      : Uncle Carry
   nameColor : 0xff1ba5f5
   role      : president
   trophies  : 51279
   icon      : @{id=28000011}

## PARAMETERS

### -ClubTag
tag of club

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
https://developer.brawlstars.com/#/documentation

## RELATED LINKS
