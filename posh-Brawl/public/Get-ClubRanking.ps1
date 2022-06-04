Function Get-ClubRanking {
   <#
.Synopsis
   Get information about a single player by player tag
.DESCRIPTION
   Get information about a single player by player tag
.PARAMETER CountryCode
   Type: String
   Two letter country code

.PARAMETER limit
   Type: INT
   Default Value: 200
   Limit the number of items returned in the response. Valid value is between 1 and 200

.PARAMETER global
   Global endpoint
.EXAMPLE
   Get-ClubRanking
      tag         : #2GUU9908V
      name        : BC*|Family*
      badgeId     : 8000006
      trophies    : 1504063
      rank        : 1
      memberCount : 30

      tag         : #P8PV2YU9
      name        : Game.Tv ITA
      badgeId     : 8000055
      trophies    : 1474250
      rank        : 2
      memberCount : 30
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
   }
   Process {
      if ($Global -or (-not ($CountryCode))) {
         Write-Verbose -Message "Global Switch detected or country code is null, setting search to Global..."
         Invoke-BrawlRequest -Uri $URI
      } else {
         [Uri]$Uri = "$script:RankingsEndpoint/$CountryCode/clubs?limit=$limit"
         Invoke-BrawlRequest -Uri $URI
      }
   }
}
