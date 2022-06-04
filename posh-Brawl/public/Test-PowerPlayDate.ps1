Function Test-PowerPlayDate {
   <#
   .Synopsis
      Tests to ensure the dates being checked is between the proper dates for powerplay
   .DESCRIPTION
      Tests to ensure the dates being checked is between the proper dates for powerplay
   .PARAMETER Date
      Date to query
   .EXAMPLE
      Test-PowerPlayDate -Date "$((Get-Date).date)"

         True
   .EXAMPLE
      Test-PowerPlayDate -Date 10/30/2019

      True
   .EXAMPLE
      Test-PowerPlayDate -Date 10/01/2018

      False
   #>

   [CmdletBinding()]
   Param (
      [Parameter(ValueFromPipeline)]
      $Date
   )
   Begin {
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
