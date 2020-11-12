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
      [Parameter(Mandatory)][ValueFrom]
      [String]$PlayerTag,
      [String]$Token = $script:token,
      [String]$Uri = "$script:baseUri/$Script:PlayersEndPoint/%23$PlayerTag/battlelog"
   )
   Process {
      $headers = @{
         authorization = "Bearer $token"
         }
      If ($null -eq $script:token) {
      Throw "`$script:token is null. Please run the function Connect-Brawl to set up your session."
      }
      If ($playertag -match "^#") {
         $PlayerTag = $PlayerTag -replace "^#", ""
         $Uri = "$script:baseUri/$Script:PlayersEndPoint/%23$PlayerTag/battlelog"
      }
      Write-Verbose "Player Tag is set to $Playertag"
      $response = Invoke-RestMethod -Method Get -Uri $Uri -ContentType "application/json" -Headers $Headers
      return $response
   }
}