Function Get-PowerPlayRanking {
   <#
.Synopsis
   
.DESCRIPTION
   
.EXAMPLE
   Get-PowerPlayRanking
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
   Begin {
   }
   Process {
   }
}
