Function Get-BattleLog {
   <#
.Synopsis
   Get list of recent battle results for a player
.DESCRIPTION
   Get list of recent battle results for a player. NOTE: It may take up to 30 minutes for a new battle to appear in the battlelog
.EXAMPLE
   Get-BattleLog -PlayerTag #C08UC2C
.NOTES
   https://developer.brawlstars.com/#/documentation


#>

   [CmdletBinding()]
   Param (
      [Parameter(ValueFromPipeline)]
      [String]$PlayerTags = $script:DefaultPlayerTag,
      [uri]$Uri = "$script:baseUri/$Script:PlayersEndPoint/%23$PlayerTag/battlelog"
   )
   Process {
         #Tags are all upper case
         $PlayerTag = $PlayerTag.ToUpper()
         If ($PlayerTag -match "^#") {
            $PlayerTag = $PlayerTag -replace "^#", ""
            $Uri = "$script:baseUri/$Script:PlayersEndPoint/%23$PlayerTag/battlelog"
         }
         Write-Verbose "Player Tag is set to $PlayerTag"
         $response = Invoke-RestMethod -Method Get -Uri $Uri -ContentType "application/json" -Headers $Script:headers
         $response.items
   }
}