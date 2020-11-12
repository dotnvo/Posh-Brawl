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
      [Parameter(Mandatory)][ValidatePattern('[#0289PYLQGRJCUV]')]
      [String]$PlayerTag,
      [String]$Token = $script:Token,
      [String]$Uri = "$script:BaseUri/$Script:PlayersEndPoint/%23$PlayerTag"
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
      return $Response
   }
}