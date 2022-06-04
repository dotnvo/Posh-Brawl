Function Get-BrawlerRanking {
   <#
.Synopsis
   Get brawler rankings for a country or global ranking.
.DESCRIPTION
   Get brawler rankings for a country or global rankings. Brawler identifiers can be found by using the /v1/brawlers API endpoint.
.PARAMETER Limit
   Type: INT
   Default Value: 200
   Limit the number of items returned in the response. Valid value is between 1 and 200
.PARAMETER CountryCode
   Type: String
   Two letter country code
.PARAMETER Global
   Type: Switch
   This parameter forces checking the Global endpoint

.PARAMETER BrawlerID
   Type: INT
   Alias: ID
   Identifier of the brawler. Can be queried using Get-Brawler

.EXAMPLE
   Get-BrawlerRanking -BrawlerID 16000011 -Limit 1

      tag       : #20288898G
      name      : ☔︎LT|Rayy-Nex☔︎
      nameColor : 0xffffffff
      icon      : @{id=28000014}
      trophies  : 1270
      rank      : 1
      club      : @{name=ReVant}

.EXAMPLE
   Get-Brawler -Name Shelly | Get-BrawlerRanking

.EXAMPLE
   16000012 | Get-BrawlerRanking

.EXAMPLE

16000013 | Get-BrawlerRanking -Limit 1

.NOTES
   https://developer.brawlstars.com/#/documentation
   To do: This endpoint supports before and after query strings, need to add logic and parameter sets
   to support this scenario.


#>

   [CmdletBinding(DefaultParameterSetName = 'Global')]
   param (
      [Parameter(ParameterSetName = 'CountryCode')]
      [AllowNull()]
      [ValidatePattern('^[A-Za-z]{2}$')]
      [String]$CountryCode,

      [Parameter(ParameterSetName = 'Global')]
      [Parameter(ParameterSetName = 'CountryCode')]
      [ValidateRange(1, 200)]
      [int]$Limit = 200,

      [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName, ParameterSetName = 'Global')]
      [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName, ParameterSetName = 'CountryCode')]
      [Alias('ID')]
      [int]$BrawlerID,

      [Parameter(ParameterSetName = 'Global')]
      [Switch]$Global
   )

   process {
      if ($Global -or (-not ($CountryCode))) {
         Write-Verbose -Message "Running in global mode..."
         [Uri]$Uri = "$script:RankingsEndpoint/Global/brawlers/${brawlerid}?limit=$Limit"
      } else {
         Write-Verbose -Message "Running in country mode..."
         [Uri]$Uri = "$script:RankingsEndpoint/$CountryCode/${brawlerid}?limit=$limit"
      }

      Invoke-BrawlRequest -Uri $URI

   }
}
