Function Get-BrawlerIDIndexList {
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
   )
   Process {
      $Path = $Script:moduleBase + "\assets" + "\BrawlerIndex.csv"
      $BrawlerIndex = Import-Csv -Path $Path
      $BrawlerIndex.id
   }
}