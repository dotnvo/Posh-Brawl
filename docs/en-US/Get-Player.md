---
external help file: posh-Brawl-help.xml
Module Name: Posh-Brawl
online version:
schema: 2.0.0
---

# Get-Player

## SYNOPSIS
Get information about a single player by player tag

## SYNTAX

```
Get-Player [-PlayerTag <String>] [-BestBrawler] [<CommonParameters>]
```

## DESCRIPTION
Get information about a single player by player tag

## EXAMPLES

### EXAMPLE 1
```
Get-Player -PlayerTag '#C08UC2C'
```

tag                                  : #C08UC2C
   name                                 : Imagine
   nameColor                            : 0xffffce89
   icon                                 : @{id=28000000}
   trophies                             : 27802
   highestTrophies                      : 38103
   highestPowerPlayPoints               : 1123
   expLevel                             : 264
   expPoints                            : 357018
   isQualifiedFromChampionshipChallenge : False
   3vs3Victories                        : 20896
   soloVictories                        : 569
   duoVictories                         : 2744
   bestRoboRumbleTime                   : 5
   bestTimeAsBigBrawler                 : 0
   club                                 :
   brawlers                             : {@{id=16000000; name=SHELLY; power=9; rank=26; trophies=574;
                                          highestTrophies=807; gears=System.Object\[\]; starPowers=System.Object\[\];
                                          gadgets=System.Object\[\]}, @{id=16000001; name=COLT; power=9; rank=27;
                                          trophies=524; highestTrophies=874; gears=System.Object\[\];
                                          starPowers=System.Object\[\]; gadgets=System.Object\[\]}, @{id=16000002; name=BULL;
                                          power=9; rank=27; trophies=549; highestTrophies=858; gears=System.Object\[\];
                                          starPowers=System.Object\[\]; gadgets=System.Object\[\]}, @{id=16000003;
                                          name=BROCK; power=9; rank=30; trophies=574; highestTrophies=1039;
                                          gears=System.Object\[\]; starPowers=System.Object\[\]; gadgets=System.Object\[\]}…}

### EXAMPLE 2
```
Get-Player -PlayerTag C08UC2C -BestBrawler
```

tag                                  : #C08UC2C
   name                                 : Imagine
   nameColor                            : 0xffffce89
   icon                                 : @{id=28000000}
   trophies                             : 27802
   highestTrophies                      : 38103
   highestPowerPlayPoints               : 1123
   expLevel                             : 264
   expPoints                            : 357018
   isQualifiedFromChampionshipChallenge : False
   3vs3Victories                        : 20896
   soloVictories                        : 569
   duoVictories                         : 2744
   bestRoboRumbleTime                   : 5
   bestTimeAsBigBrawler                 : 0
   club                                 :
   brawlers                             : {@{id=16000000; name=SHELLY; power=9; rank=26; trophies=574;
                                          highestTrophies=807; gears=System.Object\[\]; starPowers=System.Object\[\];
                                          gadgets=System.Object\[\]}, @{id=16000001; name=COLT; power=9; rank=27;
                                          trophies=524; highestTrophies=874; gears=System.Object\[\];
                                          starPowers=System.Object\[\]; gadgets=System.Object\[\]}, @{id=16000002; name=BULL;
                                          power=9; rank=27; trophies=549; highestTrophies=858; gears=System.Object\[\];
                                          starPowers=System.Object\[\]; gadgets=System.Object\[\]}, @{id=16000003;
                                          name=BROCK; power=9; rank=30; trophies=574; highestTrophies=1039;
                                          gears=System.Object\[\]; starPowers=System.Object\[\]; gadgets=System.Object\[\]}…}
   bestbrawler                          : @{id=16000003; name=BROCK; power=9; rank=30; trophies=574;
                                          highestTrophies=1039; gears=System.Object\[\]; starPowers=System.Object\[\];
                                          gadgets=System.Object\[\]}

## PARAMETERS

### -PlayerTag
Player tag

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -BestBrawler
Type: Switch
outputs the brawler with the highest trophy this player has.

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
