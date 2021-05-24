Function Get-BrawlerIndexList {
   <#
.Synopsis
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
      $BrawlerIndex.name | Sort-Object
   }
}