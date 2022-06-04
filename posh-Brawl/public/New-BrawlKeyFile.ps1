Function New-BrawlKeyFile {
    <#
        .SYNOPSIS
            Creates a key file
        .DESCRIPTION
            Creates a key file. This is used to authenticate to the brawl stars API
            Under the hood it uses Export-CLIXML to utilize windows dpapi encryption.

        .PARAMETER Secretname
            Name of file
        .PARAMETER Directory
            directory to store file in
        .EXAMPLE
        New-BrawlKeyFile

            File
            ----
            Test.Secret
        .NOTES
            Should make this a little cleaner.

    #>

    [CmdletBinding()]
    Param (
        $Directory = "$Script:KeysDirectory",
        [String]$SecretName = "Default.Secret"
    )

    Process {
        $Credential = Get-Credential -Message "Enter API Key" -UserName "API"


        If (-not (Test-Path -Path "$Directory\$SecretName")) {
            $Credential | Export-Clixml -Path "$Directory\$SecretName" | Out-Null
        } Else {
            Write-Warning -Message "File $SecretName already exists in $Directory... setting unique name"
            $SecretName = "Key-$(Get-Date -Format FileDateTime).Secret"
            Write-Host "File name Set to $SecretName"
            $Credential | Export-Clixml -Path "$Script:KeysDirectory\$SecretName" | Out-Null
        }
        $CredentialInfo = [PSCustomObject][ordered]@{
            "File" = $SecretName
        }
        $CredentialInfo
    }
}
