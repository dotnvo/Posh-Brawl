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
      [ValidateRange(1,200)]
      [int]$Limit = 200,
      [Uri]$Uri = "$script:BaseUri/$script:RankingsEndpoint/Global/clubs?limit=$Limit",
      [Switch]$Global
   )
   Process {
      if ($Global -or (!($CountryCode))) {
         Write-Verbose -Message "Global Switch detected or country code is null, setting search to Global..."
         Try {
            $Response = Invoke-RestMethod -Method Get -Uri $Uri -ContentType "application/json" -Headers $Script:headers
            $Response.items
         } catch {
         }
      } else {
         Try {
            [Uri]$Uri = "$script:BaseUri/$script:RankingsEndpoint/$CountryCode/clubs?limit=$limit"
            $Response = Invoke-RestMethod -Method Get -Uri $Uri -ContentType "application/json" -Headers $Script:headers
            $Response.items
         } catch {
         }
      }
   }
}