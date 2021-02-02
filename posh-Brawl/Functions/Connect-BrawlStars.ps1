Function Connect-BrawlStars {
   <#
.Synopsis
   Setup to use Brawl API in POSH
.DESCRIPTION
This function imports your configuration during a powershell session for use with other corresponding Posh-Brawl cmdlets.

.EXAMPLE
   Connect-BrawlStars -ConfigPath .\Config.json
.NOTES
   https://developer.brawlstars.com/#/documentation


#>

   [CmdletBinding()]
   Param (
      [Parameter(Mandatory)]
      [String]$ConfigPath,
      [string]$BaseUri = "https://api.brawlstars.com/v1",
      [string]$PlayerEndPoint = "players",
      [string]$ClubsEndPoint = "clubs",
      [string]$RankingsEndpoint = "rankings",
      [string]$BrawlersEndpoint = "brawlers"
   )
   [String]$Json = Get-Content $ConfigPath
      
   $Config = $Json | ConvertFrom-Json
   $Config.APIToken = $Config.APIToken | ConvertTo-SecureString
   [PSCredential]$creds = New-Object System.Management.Automation.PSCredential -ArgumentList $Config.Username, $Config.apitoken
   $DefaultPlayerTag = $Config.DefaultPlayerTag

   $script:Token = $creds.GetNetworkCredential().password
   $script:baseUri = $baseUri
   $script:PlayersEndPoint = $PlayerEndPoint
   $script:ClubsEndpoint = $ClubsEndpoint
   $script:RankingsEndpoint = $RankingsEndpoint
   $script:BrawlersEndpoint = $BrawlersEndpoint
   $script:DefaultPlayerTag = $DefaultPlayerTag
}