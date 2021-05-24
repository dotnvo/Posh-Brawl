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
      [Parameter(Mandatory)]
      [String]$ClubTag,
      [Uri]$Uri = "$script:baseUri/$script:ClubsEndpoint/%23$ClubTag/members"
   )
   Process {
      If ($ClubTag -match "^#") {
         $ClubTag = $ClubTag -replace "^#", ""
         $Uri = "$script:baseUri/$script:ClubsEndpoint/%23$ClubTag/members"
      }
      Write-Verbose "Player Tag is set to $ClubTag"
      $response = Invoke-RestMethod -Method Get -Uri $Uri -ContentType "application/json" -Headers $Script:headers
      $response = $response.items
      Write-Output $response
   }
}