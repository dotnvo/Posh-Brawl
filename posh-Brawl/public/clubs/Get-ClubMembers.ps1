Function Get-ClubMembers {
   <#
.Synopsis
   List Club Members
.DESCRIPTION
   This function gets a list of club members.
.EXAMPLE
   Connect-Brawl
.NOTES
   https://developer.brawlstars.com/#/documentation


#>

   [CmdletBinding()]
   Param (
      [Parameter(ValueFromPipeline,Mandatory)]
      [String]$ClubTag
   )
   Begin {
      [Uri]$Uri = "$script:ClubsEndpoint/%23$ClubTag/members"
      If ($Script:ConnnectionComplete -ne 1) {
         Write-Error -Message "Please run Connect-BrawlStars to configure your current session." -ErrorAction Stop
      }
   }
   Process {
      If ($ClubTag -match "^#") {
         $ClubTag = $ClubTag -replace "^#", ""
         $Uri = "$script:ClubsEndpoint/%23$ClubTag/members"
      }
      Write-Verbose "Player Tag is set to $ClubTag"
      Invoke-BrawlRequest -uri $Uri

   }
}