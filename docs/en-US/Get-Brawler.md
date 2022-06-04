---
external help file: posh-Brawl-help.xml
Module Name: Posh-Brawl
online version:
schema: 2.0.0
---

# Get-Brawler

## SYNOPSIS
Get Brawler information

## SYNTAX

### All (Default)
```
Get-Brawler [-All] [<CommonParameters>]
```

### BrawlerID
```
Get-Brawler [-BrawlerID <String>] [<CommonParameters>]
```

### Name
```
Get-Brawler [[-Name] <String>] [<CommonParameters>]
```

## DESCRIPTION
Get-Brawler, simply put, returns brawler information.

## EXAMPLES

### EXAMPLE 1
```
Get-brawler
```

id name          starPowers                                                                    gadgets
   -- ----          ----------                                                                    -------
   16000000 SHELLY        {@{id=23000076; name=SHELL SHOCK}, @{id=23000135; name=BAND-AID}}             {@{id=23000255; name=FAST FORWARD}, @{id=23000288; name=CLAY PIGEONS}}
   16000001 COLT          {@{id=23000077; name=SLICK BOOTS}, @{id=23000138; name=MAGNUM SPECIAL}}       {@{id=23000273; name=SPEEDLOADER}, @{id=23000319; name=SILVER BULLET}}
   16000002 BULL          {@{id=23000078; name=BERSERKER}, @{id=23000137; name=TOUGH GUY}}              {@{id=23000272; name=T-BONE INJECTOR}, @{id=23000310; name=STOMPER}}
   16000003 BROCK         {@{id=23000079; name=INCENDIARY}, @{id=23000150; name=ROCKET NO.
4}}          {@{id=23000245; name=ROCKET LACES}, @{id=23000316; name=ROCKET FUEL}}
   16000004 RICO          {@{id=23000080; name=SUPER BOUNCY}, @{id=23000156; name=ROBO RETREAT}}        {@{id=23000246; name=MULTIBALL LAUNCHER}}
   16000005 SPIKE         {@{id=23000081; name=FERTILIZE}, @{id=23000151; name=CURVEBALL}}              {@{id=23000247; name=POPPING PINCUSHION}}
   16000006 BARLEY        {@{id=23000082; name=MEDICAL USE}, @{id=23000158; name=EXTRA NOXIOUS}}        {@{id=23000250; name=STICKY SYRUP MIXER}, @{id=23000293; name=HERBAL TONIC}}
   16000007 JESSIE        {@{id=23000083; name=ENERGIZE}, @{id=23000149; name=SHOCKY}}                  {@{id=23000251; name=SPARK PLUG}, @{id=23000295; name=RECOIL SPRING}}
   16000008 NITA          {@{id=23000084; name=BEAR WITH ME}, @{id=23000136; name=HYPER BEAR}}          {@{id=23000249; name=BEAR PAWS}, @{id=23000314; name=FAUX FUR}}
   16000009 DYNAMIKE      {@{id=23000085; name=DYNA-JUMP}, @{id=23000155; name=DEMOLITION}}             {@{id=23000258; name=FIDGET SPINNER}, @{id=23000294; name=SATCHEL CHARGE}}
   16000010 EL PRIMO      {@{id=23000086; name=EL FUEGO}, @{id=23000140; name=METEOR RUSH}}             {@{id=23000264; name=SUPLEX SUPPLEMENT}, @{id=23000292; name=ASTEROID BELT}}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Trimmed Response for Comment-based help~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### EXAMPLE 2
```
Get-Brawler -BrawlerID "16000011"
         id name   starPowers                                                               gadgets
         -- ----   ----------                                                               -------
         16000011 MORTIS {@{id=23000087; name=CREEPY HARVEST}, @{id=23000154; name=COILED SNAKE}} {@{id=23000265; name=COMBO SPINNER}, @{id=23000290; name=SURVIVAL SHOVEL}}
```

### EXAMPLE 3
```
Get-Brawler -Name Brock
         id name  starPowers                                                           gadgets
         -- ----  ----------                                                           -------
         16000003 BROCK {@{id=23000079; name=INCENDIARY}, @{id=23000150; name=ROCKET NO. 4}} {@{id=23000245; name=ROCKET LACES}, @{id=23000316; name=ROCKET FUEL}}
```

### EXAMPLE 4
```
"El Primo" | Get-Brawler
         id name     starPowers                                                        gadgets
         -- ----     ----------                                                        -------
         16000010 EL PRIMO {@{id=23000086; name=EL FUEGO}, @{id=23000140; name=METEOR RUSH}} {@{id=23000264; name=SUPLEX SUPPLEMENT}, @{id=23000292; name=ASTEROID BELT}}
```

## PARAMETERS

### -BrawlerID
Part of the ParameterSet 'BrawlerID'.

```yaml
Type: String
Parameter Sets: BrawlerID
Aliases: ID, Identifier

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Name
The Name of the Brawler.
Part of the ParameterSet 'Name'.
This will use a local index to determine the ID to pass to the endpoint.

```yaml
Type: String
Parameter Sets: Name
Aliases: Brawler, Hero

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -All
Part of the default ParameterSet 'All'.
If no parameters are passed and no pipeline data is pass, the all parameterset is used.
This will return all brawlers from the /brawlers endpoint.

```yaml
Type: SwitchParameter
Parameter Sets: All
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
GET /brawlers/{brawlerId}
GET /brawlers

## RELATED LINKS
