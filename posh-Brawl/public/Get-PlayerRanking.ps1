Function Get-PlayerRanking {
   <#
.Synopsis
   Get player rankings for a country or global rankings.

.DESCRIPTION
   Get player rankings for a country or global rankings.

.PARAMETER CountryCode
   Type: String
   Two letter country code

.PARAMETER limit
   Type: INT
   Default Value: 200
   Limit the number of items returned in the response. Valid value is between 1 and 200

.PARAMETER Global
   Switches context to global endpoint.

.EXAMPLE
   Get-PlayerRanking -Limit 1

      tag       : #YGU20CRG
      name      : VitalShark
      nameColor : 0xffcb5aff
      icon      : @{id=28000029}
      trophies  : 64534
      rank      : 1
      club      : @{name=<c1>MERCY</c>}

.NOTES
   https://developer.brawlstars.com/#/documentation


#>

   [CmdletBinding()]
   Param (
      [Parameter()]
      [AllowNull()]
      [ValidatePattern('^[A-Za-z]{2}$')]
      [String]$CountryCode,

      [ValidateRange(1, 200)]
      [int]$Limit = 200,

      [Switch]$Global
   )
   Begin {
      [Uri]$Uri = "$script:RankingsEndpoint/Global/players?limit=$Limit"
   }
   Process {
      if ($Global -or (-not ($CountryCode))) {
         Write-Verbose -Message "Global Switch detected or country code is null, setting search to Global..."
         Invoke-BrawlRequest -Uri $URI
      } else {
         [Uri]$Uri = "$script:BaseUri/$script:RankingsEndpoint/$CountryCode/players?limit=$limit"
         Invoke-BrawlRequest -Uri $URI
      }
   }
}
