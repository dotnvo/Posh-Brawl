Function Get-BrawlerIndexList {
   <#
.Synopsis
   Gets a Brawler list.
.DESCRIPTION
   Gets a list of brawler names. This is used for autocompletion and is not a public function.
.EXAMPLE
   Get-BrawlerIndexList

   #>

   [CmdletBinding()]
   Param (
   )
   Process {
      $BrawlerIndex = Import-Csv -Path "$Script:moduleBase\bin\BrawlerIndex.csv"
      $BrawlerIndex.name | Sort-Object
   }
}
