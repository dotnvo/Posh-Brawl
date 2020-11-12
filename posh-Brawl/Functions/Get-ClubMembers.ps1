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
      [String]$Token = $script:token,
      [String]$Uri = "$script:baseUri/$script:ClubsEndpoint/%23$ClubTag/members"
   )
   Process {
      $headers = @{
         authorization = "Bearer $token"
         }
      If ($null -eq $Token) {
      Throw "`$script:token is null. Please run the function Connect-Brawl to set up your session."
      }
      If ($ClubTag -match "^#") {
         $ClubTag = $ClubTag -replace "^#", ""
         $Uri = "$script:baseUri/$script:ClubsEndpoint/%23$ClubTag/members"
      }
      Write-Verbose "Player Tag is set to $ClubTag"
      $response = Invoke-RestMethod -Method Get -Uri $Uri -ContentType "application/json" -Headers $Headers
      $response = $response.items
      return $response
   }
}