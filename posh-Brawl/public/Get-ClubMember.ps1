Function Get-ClubMember {
   <#
.Synopsis
   List Club Members
.DESCRIPTION
   This function gets a list of club members.
.EXAMPLE
   Get-ClubMember -ClubTag "208UU822P" | Select-Object -First 2

      tag       : #90QUR2QY
      name      : TQ | RaaFa
      nameColor : 0xfff9c908
      role      : member
      trophies  : 54485
      icon      : @{id=28000038}

      tag       : #VGQ0P2VU
      name      : Uncle Carry
      nameColor : 0xff1ba5f5
      role      : president
      trophies  : 51279
      icon      : @{id=28000011}


.PARAMETER ClubTag
   tag of club
.NOTES
   https://developer.brawlstars.com/#/documentation


#>

   [CmdletBinding()]
   Param (
      [Parameter(ValueFromPipeline, Mandatory)]
      [String]$ClubTag
   )
   Begin {
      [Uri]$Uri = "$script:ClubsEndpoint/%23$ClubTag/members"
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
