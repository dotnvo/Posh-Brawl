Function New-BrawlKeyFile {
    <#
        .SYNOPSIS
            Short description
        .DESCRIPTION
            Long description
        .EXAMPLE
            PS C:\> <example usage>
            Explanation of what the example does
        .INPUTS
            Inputs (if any)
        .OUTPUTS
            Output (if any)
        .NOTES
            General notes
        #>

    [CmdletBinding()]
    Param (
        $Directory = "$Script:KeysDirectory",
        $ConfigFile = $Script:DefaultConfig,
        $SecretName = "Default.Secret",
        [Parameter(Mandatory)]
        $SecretDescription
    )

    Begin {
        $Config = Get-Content -Path $ConfigFile | ConvertFrom-Json
    }
    Process {
        $Credential = Get-Credential -Message "Enter API Key (Right click to paste from clipboard)" -UserName "API"
        
        
        If (!(Test-Path -Path "$Directory\$SecretName")) {
            $Credential | Export-Clixml -Path "$Directory\$SecretName" | Out-Null
        } Else {
            Write-Warning -Message "File $SecretName already exists in $Directory... setting unique name"
            $SecretName = "Key-$(Get-Date -Format FileDateTime).Secret"
            Write-Verbose -Message "File name Set to $SecretName"
            $Credential | Export-Clixml -Path "$Script:KeysDirectory\$SecretName" | Out-Null
        }
        $CredentialInfo = [ordered]@{
            "FileName"    = $SecretName
            "Description" = $SecretDescription
        }
        $CredentialInfoObject = New-Object -TypeName PSObject -Property $CredentialInfo
        $UpdatedCredentialList = { $Config.Credentials }.Invoke()
        $UpdatedCredentialList.Add($CredentialInfoObject)
        #Remove any nulls
        $UpdatedCredentialList = $UpdatedCredentialList.Where({$null -ne $_.FileName})
        
        $Properties = [ordered]@{
            Defaults        = $Config.Defaults
            Credentials     = $UpdatedCredentialList
            FavoritePlayers = $Config.FavoritePlayers
        }

        $NewConfig = (New-Object -TypeName PSCustomObject -Property $Properties) | ConvertTo-Json
        $NewConfig | Out-File -FilePath $ConfigFile -Force
        $CredentialInfoObject
    }
}
