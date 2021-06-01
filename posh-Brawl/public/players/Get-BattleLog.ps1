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
      [String]$PlayerTag = $script:DefaultPlayerTag,
      [uri]$Uri = "$Script:PlayersEndPoint/%23$PlayerTag/battlelog"
   )
   Begin {
      If ($Script:ConnnectionComplete -ne 1) {
         Write-Error -Message "Please run Connect-BrawlStars to configure your current session." -ErrorAction Stop
      }
   }
   Process {
         #Tags are all upper case
         $PlayerTag = $PlayerTag.ToUpper()
         If ($PlayerTag -match "^#") {
            $PlayerTag = $PlayerTag -replace "^#", ""
            $Uri = "$Script:PlayersEndPoint/%23$PlayerTag/battlelog"
         }
         Write-Verbose "Player Tag is set to $PlayerTag"
         $Response = Invoke-BrawlRequest -uri $Uri
         $Response
   }
}