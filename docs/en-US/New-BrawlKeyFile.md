---
external help file: posh-Brawl-help.xml
Module Name: Posh-Brawl
online version:
schema: 2.0.0
---

# New-BrawlKeyFile

## SYNOPSIS
Creates a key file

## SYNTAX

```
New-BrawlKeyFile [[-Directory] <Object>] [[-SecretName] <String>] [<CommonParameters>]
```

## DESCRIPTION
Creates a key file.
This is used to authenticate to the brawl stars API
Under the hood it uses Export-CLIXML to utilize windows dpapi encryption.

## EXAMPLES

### EXAMPLE 1
```
New-BrawlKeyFile
```

File
    ----
    Test.Secret

## PARAMETERS

### -Directory
directory to store file in

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: "$Script:KeysDirectory"
Accept pipeline input: False
Accept wildcard characters: False
```

### -SecretName
Name of file

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: Default.Secret
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Should make this a little cleaner.

## RELATED LINKS
