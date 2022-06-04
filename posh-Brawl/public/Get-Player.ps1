Function Get-Player {
   <#
.Synopsis
   Get information about a single player by player tag
.DESCRIPTION
   Get information about a single player by player tag
.PARAMETER PlayerTag
   Player tag
.Parameter BestBrawler
   Type: Switch
   outputs the brawler with the highest trophy this player has.
.EXAMPLE
   Get-Player -PlayerTag '#C08UC2C'

      tag                                  : #C08UC2C
      name                                 : Imagine
      nameColor                            : 0xffffce89
      icon                                 : @{id=28000000}
      trophies                             : 27802
      highestTrophies                      : 38103
      highestPowerPlayPoints               : 1123
      expLevel                             : 264
      expPoints                            : 357018
      isQualifiedFromChampionshipChallenge : False
      3vs3Victories                        : 20896
      soloVictories                        : 569
      duoVictories                         : 2744
      bestRoboRumbleTime                   : 5
      bestTimeAsBigBrawler                 : 0
      club                                 :
      brawlers                             : {@{id=16000000; name=SHELLY; power=9; rank=26; trophies=574;
                                             highestTrophies=807; gears=System.Object[]; starPowers=System.Object[];
                                             gadgets=System.Object[]}, @{id=16000001; name=COLT; power=9; rank=27;
                                             trophies=524; highestTrophies=874; gears=System.Object[];
                                             starPowers=System.Object[]; gadgets=System.Object[]}, @{id=16000002; name=BULL;
                                             power=9; rank=27; trophies=549; highestTrophies=858; gears=System.Object[];
                                             starPowers=System.Object[]; gadgets=System.Object[]}, @{id=16000003;
                                             name=BROCK; power=9; rank=30; trophies=574; highestTrophies=1039;
                                             gears=System.Object[]; starPowers=System.Object[]; gadgets=System.Object[]}…}
.EXAMPLE
   Get-Player -PlayerTag C08UC2C -BestBrawler

      tag                                  : #C08UC2C
      name                                 : Imagine
      nameColor                            : 0xffffce89
      icon                                 : @{id=28000000}
      trophies                             : 27802
      highestTrophies                      : 38103
      highestPowerPlayPoints               : 1123
      expLevel                             : 264
      expPoints                            : 357018
      isQualifiedFromChampionshipChallenge : False
      3vs3Victories                        : 20896
      soloVictories                        : 569
      duoVictories                         : 2744
      bestRoboRumbleTime                   : 5
      bestTimeAsBigBrawler                 : 0
      club                                 :
      brawlers                             : {@{id=16000000; name=SHELLY; power=9; rank=26; trophies=574;
                                             highestTrophies=807; gears=System.Object[]; starPowers=System.Object[];
                                             gadgets=System.Object[]}, @{id=16000001; name=COLT; power=9; rank=27;
                                             trophies=524; highestTrophies=874; gears=System.Object[];
                                             starPowers=System.Object[]; gadgets=System.Object[]}, @{id=16000002; name=BULL;
                                             power=9; rank=27; trophies=549; highestTrophies=858; gears=System.Object[];
                                             starPowers=System.Object[]; gadgets=System.Object[]}, @{id=16000003;
                                             name=BROCK; power=9; rank=30; trophies=574; highestTrophies=1039;
                                             gears=System.Object[]; starPowers=System.Object[]; gadgets=System.Object[]}…}
      bestbrawler                          : @{id=16000003; name=BROCK; power=9; rank=30; trophies=574;
                                             highestTrophies=1039; gears=System.Object[]; starPowers=System.Object[];
                                             gadgets=System.Object[]}
.NOTES
   https://developer.brawlstars.com/#/documentation


#>

   [CmdletBinding(DefaultParameterSetName = 'PlayerTag')]
   param (
      [Parameter(ValueFromPipeline, ParameterSetName = 'PlayerTag')][ValidatePattern('[#0289PYLQGRJCUV]')]
      [String]$PlayerTag,
      [Switch]$BestBrawler
   )
   begin {
      $URI = "$Script:PlayersEndPoint/%23$PlayerTag"
   }
   process {
      Write-Verbose -Message "Get-Player : ParameterSet is set to $($PSCmdlet.ParameterSetName)"
      switch ($PSCmdlet.ParameterSetName) {
         PlayerTag {

               #Tags are all upper case
               $PlayerTag = $PlayerTag.ToUpper()
               If ($PlayerTag -match "^#") {
                  $PlayerTag = $PlayerTag -replace "^#", ""
                  $URI = "$Script:PlayersEndPoint/%23$PlayerTag"
               }
               Write-Verbose -Message "Player Tag is set to $PlayerTag"
               $Response = Invoke-BrawlRequest -URI $URI
               If ($BestBrawler) {
                  $Maximum = ($Response.brawlers.highesttrophies | Measure-Object -Maximum).Maximum
                  $HighestBrawler = $Response.Brawlers | Where-Object { $_.HighestTrophies -eq $Maximum }
                  $Response | Add-Member -NotePropertyName bestbrawler -NotePropertyValue $HighestBrawler
               }
               $Response
         }
      }
   }
}
