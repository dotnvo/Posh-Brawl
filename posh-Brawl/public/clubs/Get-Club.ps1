Function Get-Club {
   <#
.Synopsis
   Get Infomration about a single club
.DESCRIPTION
   Get information about a single club by tag. Club tags can be found in game. 
.EXAMPLE
   Get-Club -ClubTag "#2089L0PG2"
.EXAMPLE
   Get-Club -ClubTag "208UU822P"
.NOTES
   GET /clubs/{clubTag}

#>

   [CmdletBinding()]
   Param (
      [Parameter(Mandatory)][ValidatePattern('[#0289PYLQGRJCUV]')]
      [String]$ClubTag
   )
   Begin {
      [Uri]$Uri = "$script:ClubsEndpoint/%23$ClubTag"
      If ($Script:ConnnectionComplete -ne 1) {
         Write-Error -Message "Please run Connect-BrawlStars to configure your current session." -ErrorAction Stop
      }
   }
   Process {
      #Club tags start with hash character '#' and that needs to be URL-encoded properly to work in URL, so for example clan tag '#ABC' would become '%232ABC' in the URL.
      If ($ClubTag -match "^#") {
         $ClubTag = $ClubTag -replace "^#", ""
         $Uri = "$script:ClubsEndpoint/%23$ClubTag"
      }
      Write-Verbose "Player Tag is set to $ClubTag"
      Invoke-BrawlRequest -Uri $URI
   }
}