Function Test-PowerPlayDate {
   <#
.Synopsis
Tests to ensure the dates being checked is between the proper dates for powerplay
.DESCRIPTION
.EXAMPLE
.EXAMPLE
.NOTES
   #>

   [CmdletBinding()]
   Param (
      [Parameter(ValueFromPipeline)]
      $Date
   )
   Begin {
      If ($Script:ConnnectionComplete -ne 1) {
         Write-Error -Message "Please run Connect-BrawlStars to configure your current session." -ErrorAction Stop
      }
      $ScriptDate = (Get-Date $Date).Date
      $BeginDate = (Get-Date "10-28-2019").Date
      $EndDate = (Get-Date -Date ((Get-PowerPlaySeasonID)[-1].endDate)).Date
   }
   Process {
      #Write-Host "ScriptDate:$ScriptDate`nBeginDate:$BeginDate`nEndDate:$EndDate"
      if (($ScriptDate -ge $BeginDate) -and ($ScriptDate -le $EndDate)) {
         $true
      } else {
         $false
      }
   }
}