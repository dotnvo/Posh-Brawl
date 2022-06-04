Function Get-Club {
   <#
.Synopsis
   Get Infomration about a single club
.DESCRIPTION
   Get information about a single club by tag. Club tags can be found in game.

.PARAMETER ClubTag
   Club tag


.EXAMPLE
   Get-Club -ClubTag "#2089L0PG2"

      tag              : #2089L0PG2
      name             : CODEMAGIC
      description      : Clan OFFICIEL de CODEMAGIC.web : codemagic.fr 🧙‍♂️ twitter : @_CODEMAGIC_ 🧙‍♂️
                        discord.gg/codemagic 🧙‍♂️youtube.com/codemagic
      type             : closed
      badgeId          : 8000025
      requiredTrophies : 25000
      trophies         : 0
      members          : {}

.NOTES
   GET /clubs/{clubTag}

#>

   [CmdletBinding()]
   Param (
      [Parameter(Mandatory)][ValidatePattern('[#0289PYLQGRJCUV]')]
      [String]$ClubTag
   )
   Begin {
      [Uri]$Uri = "$script:ClubsEndpoint/%23$ClubTag"
   }
   Process {
      #Club tags start with hash character '#' and that needs to be URL-encoded properly to work in URL, so for example clan tag '#ABC' would become '%232ABC' in the URL.
      If ($ClubTag -match "^#") {
         $ClubTag = $ClubTag -replace "^#", ""
         $Uri = "$script:ClubsEndpoint/%23$ClubTag"
      }
      Write-Verbose "Player Tag is set to $ClubTag"
      Invoke-BrawlRequest -Uri $URI
   }
}
