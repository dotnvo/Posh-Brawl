---
external help file: posh-Brawl-help.xml
Module Name: Posh-Brawl
online version:
schema: 2.0.0
---

# Get-Club

## SYNOPSIS
Get Infomration about a single club

## SYNTAX

```
Get-Club [-ClubTag] <String> [<CommonParameters>]
```

## DESCRIPTION
Get information about a single club by tag.
Club tags can be found in game.

## EXAMPLES

### EXAMPLE 1
```
Get-Club -ClubTag "#2089L0PG2"
```

tag              : #2089L0PG2
   name             : CODEMAGIC
   description      : Clan OFFICIEL de CODEMAGIC.web : codemagic.fr 🧙‍♂️ twitter : @_CODEMAGIC_ 🧙‍♂️
                     discord.gg/codemagic 🧙‍♂️youtube.com/codemagic
   type             : closed
   badgeId          : 8000025
   requiredTrophies : 25000
   trophies         : 0
   members          : {}

## PARAMETERS

### -ClubTag
Club tag

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
GET /clubs/{clubTag}

## RELATED LINKS
