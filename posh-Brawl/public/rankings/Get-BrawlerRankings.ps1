Function Get-BrawlerRankings {
   <#
.Synopsis
   Get information about a single player by player tag
.DESCRIPTION
   Get information about a single player by player tag
.EXAMPLE
   Get-PlayerRankings
.NOTES
   https://developer.brawlstars.com/#/documentation


#>

   [CmdletBinding()]
   Param (
      [Parameter(ValueFromPipeline)][AllowNull()][ValidatePattern('[A-Za-z]')]
      [String]$CountryCode,
      [ValidateRange(1, 200)]
      [int]$Limit = 200,
      [Uri]$Uri = "$script:RankingsEndpoint/Global/brawlers/$brawlerid?limit=$Limit",
      [Switch]$Global
   )
   Process {
      if ($Global -or (!($CountryCode))) {
         Write-Verbose -Message "Global Switch detected or country code is null, setting search to Global..."
         Invoke-BrawlRequest -Uri $URI
      } else {
         [Uri]$Uri = "$script:RankingsEndpoint/$CountryCode/players?limit=$limit"
         Invoke-BrawlRequest -Uri $URI
      }
   }
}