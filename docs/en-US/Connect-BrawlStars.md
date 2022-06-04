---
external help file: posh-Brawl-help.xml
Module Name: Posh-Brawl
online version:
schema: 2.0.0
---

# Connect-BrawlStars

## SYNOPSIS
Establishes Connection to Brawl Stars API.

## SYNTAX

```
Connect-BrawlStars [[-KeyFile] <String>] [<CommonParameters>]
```

## DESCRIPTION
Establishes Connection to Brawl Stars API.

## EXAMPLES

### EXAMPLE 1
```
Connect-BrawlStars
```

Connection Successful.

## PARAMETERS

### -KeyFile
Specifies the key file which contains the token needed for authentication against the endpoints.
   -Default KeyFile is set $Script:DefaultKeyFile, found in $Script:KeysDirectory
   -Default originally set in PSM1 File.
if specified, this function overrides it
   -If you want to use a different token, specify entire path E.G.:
   C:\Users\username\Documents\MyLittleSecret.Secret

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: "$Script:DefaultKeyFile"
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
https://developer.brawlstars.com/#/getting-started

## RELATED LINKS
