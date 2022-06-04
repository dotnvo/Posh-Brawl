Function Get-PowerPlaySeasonID {
   <#
.Synopsis
   Get information about a single player by player tag
.DESCRIPTION
   Get information about a single player by player tag

.PARAMETER CountryCode
   Type: String
   Two letter country code or 'GLOBAL' to query global endpoint


.PARAMETER LIMIT
   Type: INT
   Default Value: 200
   Limit the number of items returned in the response. Valid value is between 1 and 200
.PARAMETER Date
   Date to query in MM-dd-yyyy OR M-d-yyyy format.

.EXAMPLE
   Get-PowerPlaySeasonID -Limit 5

      id startDate  endDate
      -- ---------  -------
      56 10-28-2019 11-11-2019
      57 11-11-2019 11-25-2019
      58 11-25-2019 12-09-2019
      59 12-09-2019 12-23-2019
      60 12-23-2019 01-06-2020

.EXAMPLE
   Get-PowerPlaySeasonID -CountryCode US -Date 6-2-2022

      id  startDate  endDate
      --  ---------  -------
      123 05-23-2022 06-06-2022
.NOTES
   https://developer.brawlstars.com/#/documentation
#>
   [CmdletBinding()]
   Param (
      [Parameter(ValueFromPipeline)][AllowNull()][ValidatePattern('^[A-Za-z]{2}$|^Global$')]
      [String]$CountryCode,
      [ValidateRange(1, 200)]
      [int]$Limit = 200,
      [String]$Date
   )
   Begin {
      [Uri]$Uri = "$script:RankingsEndpoint/Global/powerplay/seasons?limit=$Limit"

      $pattern = '^(?<Year>\d{4})(?<Month>\d{2})(?<Day>\d{2}T\d{2})(?<Hour>\d{2})(?<Minute>\d{2})(?<Seconds>\.\d{3}Z)$'
      If ($Date) {
         If ($Date -notmatch '\d{1,2}-\d{1,2}-\d{4}') {
            Throw "`$Date value is not in the correct format. Please use the following formats: MM-dd-yyyy OR M-d-yyyy."
         }
         if (-not(Test-PowerPlayDate $Date)) {
            Write-Warning -Message "Date provided in `$Date variable is outside range of available dates. All SeasonIds within the given limit will be returned..."
            Remove-Variable -Name Date -Force
         }
      }
      $replacement = '${Year}-${Month}-${Day}:${Hour}:${Minute}${Seconds}'
   }
   Process {
      if ($Global -or (-not($CountryCode))) {
         Write-Verbose -Message "Global Switch detected or country code is null, setting search to Global..."
         Try {
            $Response = Invoke-BrawlRequest -Uri $URI
            ForEach ($Record in $Response) {
               $Record.startTime = Get-Date ($Record.startTime -replace $pattern, $replacement) -Format "MM-dd-yyyy"
               $Record.endTime = Get-Date ($Record.endTime -replace $pattern, $replacement) -Format "MM-dd-yyyy"
            }
         } catch {
         }
      } else {
         Try {
            [Uri]$Uri = "$script:RankingsEndpoint/$CountryCode/powerplay/seasons?limit=$limit"
            $Response = Invoke-BrawlRequest -Uri $URI
            ForEach ($Record in $Response) {
               $Record.startTime = Get-Date ($Record.startTime -replace $pattern, $replacement) -Format "MM-dd-yyyy"
               $Record.endTime = Get-Date ($Record.endTime -replace $pattern, $replacement) -Format "MM-dd-yyyy"
            }
         } catch {
         }
      }
      $object = $Response | Select-Object id, @{Name = "startDate"; Expression = { $_.Starttime } }, @{Name = "endDate"; Expression = { $_.Endtime } }
      if ($Date) {
         Write-Verbose "Date set to : [DateTime]$Date"
         $object | Where-Object { ([DateTime]$Date -ge [DateTime]$_.StartDate) -and ([DateTime]$Date -le [DateTime]$_.endDate) }
      } Else {
         $Object
      }
   }
}
