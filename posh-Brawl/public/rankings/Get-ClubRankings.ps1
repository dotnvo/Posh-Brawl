Function Get-ClubRankings {
   <#
.Synopsis
   Get information about a single player by player tag
.DESCRIPTION
   Get information about a single player by player tag
.EXAMPLE
   Get-ClubRankings
.NOTES
   https://developer.brawlstars.com/#/documentation


#>

   [CmdletBinding()]
   Param (
      [Parameter(ValueFromPipeline)][AllowNull()][ValidatePattern('[A-Za-z]')]
      [String]$CountryCode,
      [ValidateRange(1, 200)]
      [int]$Limit = 200,
      [Switch]$Global
   )
   Begin {
      [Uri]$Uri = "$script:RankingsEndpoint/Global/clubs?limit=$Limit"
      If ($Script:ConnnectionComplete -ne 1) {
         Write-Error -Message "Please run Connect-BrawlStars to configure your current session." -ErrorAction Stop
      }
   }
   Process {
      if ($Global -or (!($CountryCode))) {
         Write-Verbose -Message "Global Switch detected or country code is null, setting search to Global..."
         Invoke-BrawlRequest -Uri $URI
      } else {
         [Uri]$Uri = "$script:RankingsEndpoint/$CountryCode/clubs?limit=$limit"
         Invoke-BrawlRequest -Uri $URI
      }
   }
}