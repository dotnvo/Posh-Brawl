Function Get-BrawlerIDIndexList {
   <#
.Synopsis
   Gets a Brawler ID Index list.
.DESCRIPTION
   Gets a list of brawler IDs. This is used for autocompletion and is not a public function.
.EXAMPLE
   Get-BrawlerIDIndexList

   #>

   [CmdletBinding()]
   Param (
   )
   Process {
      $Path = "$Script:moduleBase\assets\BrawlerIndex.csv"
      $BrawlerIndex = Import-Csv -Path $Path
      $BrawlerIndex.id
   }
}
