Function Add-FavoritePlayer {
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
        [Alias("tag")]
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [String]$PlayerTag,
        [Alias("Name")]
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [String]$PlayerName,
        $ConfigFile = $Script:DefaultConfig

    )

    Begin {
        $Config = Get-Content -Path $ConfigFile | ConvertFrom-Json
    }
    Process {
        $PlayerToAdd = [ordered]@{
            "PlayerTag"    = $PlayerTag
            "PlayerName" = $PlayerName
        }
        $PlayerObject = New-Object -TypeName PSObject -Property $PlayerToAdd
        $UpdatedPlayers = { $Config.FavoritePlayers }.Invoke()
        $UpdatedPlayers.Add($PlayerObject)
        #Remove any nulls
        $UpdatedPlayers = $UpdatedPlayers.Where({$null -ne $_.PlayerTag})
        
        $Properties = [ordered]@{
            Defaults        = $Config.Defaults
            Credentials     = $Config.Credentials
            FavoritePlayers = $UpdatedPlayers
        }

        $UpdatedConfig = (New-Object -TypeName PSCustomObject -Property $Properties) | ConvertTo-Json
        $UpdatedConfig
        $UpdatedConfig | Out-File -FilePath $ConfigFile -Force
        If (((Get-Content "C:\Users\Nick\Documents\Github\Posh-Brawl\posh-Brawl\Configs\Default.json" | ConvertFrom-Json).FavoritePlayers.PlayerTag) -contains $PlayerObject.PlayerTag) {
            Write-Output "$($PlayerObject.PlayerName) has been added to the following configuration file : $ConfigFile in Directory : $Directory"
        } Else {
            $Config | Out-File -FilePath $ConfigFile -Force
            Write-Warning -Message "File was not updated properly. Rolling back changes..." 
        }
    }
}
