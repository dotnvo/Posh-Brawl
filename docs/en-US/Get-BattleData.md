---
external help file: posh-Brawl-help.xml
Module Name: Posh-Brawl
online version:
schema: 2.0.0
---

# Get-BattleData

## SYNOPSIS
Get Battle Summary Data of last 25 games of player

## SYNTAX

```
Get-BattleData [[-PlayerTag] <String>] [-IgnoreDraws] [<CommonParameters>]
```

## DESCRIPTION
Get Battle Summary Data of last 25 games of player

## EXAMPLES

### EXAMPLE 1
```
Get-BattleData -PlayerTag 'YGU20CRG'
```

Player               : VitalShark
   PlayerTag            : YGU20CRG
   Wins                 : 24
   RoyaleWins           : 0
   StarPlayerTotal      : 12
   StarPlayerPercentage : 50
   Loses                : 1
   Draws                : 0
   WinPercent           : 96
   TotalRoyaleGames     :
   TotalGames           : 25
   Modes                : {@{GamesPlayed=3; Name=bounty}, @{GamesPlayed=22; Name=brawlBall}}

### EXAMPLE 2
```
Get-BattleData -PlayerTag '#YGU20CRG' -IgnoreDraws
```

## PARAMETERS

### -PlayerTag
PlayerTag of a user/player

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

### -IgnoreDraws
Ignore games that ended in a draw.
This may mean the total count is less than 25.

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
