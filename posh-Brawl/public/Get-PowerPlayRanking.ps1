Function Get-PowerPlayRanking {
   <#
.Synopsis
   Coming Soon
.DESCRIPTION
   Coming Soon

.PARAMETER CountryCode
   Type: String
   Two letter country code

.PARAMETER limit
   Type: INT
   Default Value: 200
   Limit the number of items returned in the response. Valid value is between 1 and 200

.PARAMETER SeasonID
   ID of Season, found by running Get-PowerPlaySeasonID

.PARAMETER URI
   Probably not needed but URI of endpoint

.EXAMPLE
   Get-PowerPlayRanking

   Coming Soon
.NOTES
   https://developer.brawlstars.com/#/documentation
   GET /rankings/{countryCode}/powerplay/seasons/{seasonId}

#>

   [CmdletBinding()]
   Param (
      [Parameter(ValueFromPipeline)][AllowNull()][ValidatePattern('^[A-Za-z]{2}$|^Global$')]
      [String]$CountryCode,
      [ValidateRange(1, 200)]
      [int]$Limit = 200,
      [Uri]$Uri = "$script:BaseUri/$script:RankingsEndpoint/Global/powerplay/seasons?limit=$Limit",
      [String]$SeasonID = "latest"
   )
   Process {
      Write-Host "Coming Soon, this function isn't implemented yet!"
   }
}
