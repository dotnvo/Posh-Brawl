Function Get-Player {
   <#
.Synopsis
   Get information about a single player by player tag
.DESCRIPTION
   Get information about a single player by player tag
.EXAMPLE
   Get-Player -PlayerTag #C08UC2C
.NOTES
   https://developer.brawlstars.com/#/documentation


#>

   [CmdletBinding()]
   Param (
      [Parameter()][ValidatePattern('[#0289PYLQGRJCUV]')]
      [String]$PlayerTag  = $script:DefaultPlayerTag,
      [String]$Token = $script:Token,
      [String]$Uri = "$script:BaseUri/$Script:PlayersEndPoint/%23$PlayerTag",
      [Switch]$BestBrawler
   )
   Process {
      $headers = @{
         authorization = "Bearer $token"
         }
      If ($null -eq $Token) {
      Throw "`$script:token is null. Please run the function Connect-Brawl to set up your session."
      }
      If ($PlayerTag -match "^#") {
         $PlayerTag = $PlayerTag -replace "^#", ""
         $Uri = "$script:baseUri/$Script:PlayersEndPoint/%23$PlayerTag"
      }
      Write-Verbose "Player Tag is set to $PlayerTag"
      $Response = Invoke-RestMethod -Method Get -Uri $Uri -ContentType "application/json" -Headers $Headers
      If ($BestBrawler) {
         $Maximum = ($Response.brawlers.highesttrophies | Measure-Object -Maximum).Maximum
         $HighestBrawler = $Response.Brawlers | Where-Object {$_.HighestTrophies -eq $Maximum}
         $Response | Add-Member -NotePropertyName bestbrawler -NotePropertyValue $HighestBrawler
      }
         return $Response
   }
}