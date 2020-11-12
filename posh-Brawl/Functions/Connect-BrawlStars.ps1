Function Connect-BrawlStars {
   <#
.Synopsis
   Setup to use Brawl API in POSH
.DESCRIPTION
This function imports your configuration during a powershell session for use with other corresponding Posh-Brawl cmdlets.

.EXAMPLE
   Connect-Brawl -Token "xyz112erkwjl2j34l23jl324l34j"
.NOTES
   https://developer.brawlstars.com/#/documentation


#>

   [CmdletBinding()]
   Param (
      [Parameter(Mandatory)]
      [String]$Token,
      [string]$BaseUri = "https://api.brawlstars.com/v1",
      [string]$PlayerEndPoint = "players",
      [string]$ClubsEndPoint = "clubs",
      [string]$RankingsEndpoint = "rankings",
      [string]$BrawlersEndpoint = "brawlers"
   )

   $script:Token = $Token
   $script:baseUri = $baseUri
   $script:PlayersEndPoint = $PlayerEndPoint
   $script:ClubsEndpoint = $ClubsEndpoint
   $script:RankingsEndpoint = $RankingsEndpoint
   $script:BrawlersEndpoint = $BrawlersEndpoint
}

