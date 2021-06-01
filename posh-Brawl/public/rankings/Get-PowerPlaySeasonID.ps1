Function Get-PowerPlaySeasonID {
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
      [Parameter(ValueFromPipeline)][AllowNull()][ValidatePattern('^[A-Za-z]{2}$|^Global$')]
      [String]$CountryCode,
      [ValidateRange(1, 200)]
      [int]$Limit = 200,
      [String]$Date
   )
   Begin {
      [Uri]$Uri = "$script:RankingsEndpoint/Global/powerplay/seasons?limit=$Limit"
      If ($Script:ConnnectionComplete -ne 1) {
         Write-Error -Message "Please run Connect-BrawlStars to configure your current session." -ErrorAction Stop
      }
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
