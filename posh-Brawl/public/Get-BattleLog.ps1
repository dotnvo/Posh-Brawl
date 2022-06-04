Function Get-BattleLog {
   <#
.Synopsis
   Get list of recent battle results for a player
.DESCRIPTION
   Get list of recent battle results for a player.
   If no recent matches have been played, may return a status 404
   NOTE: It may take up to 30 minutes for a new battle to appear in the battlelog
.PARAMETER PlayerTag
   Playertag

.PARAMETER URI
   uri of endpoint..
.EXAMPLE
   Get-BattleLog -PlayerTag 'YGU20CRG'

      battleTime           event                                            battle
      ----------           -----                                            ------
      20220602T062543.000Z @{id=0; map=}                                    @{mode=bounty; type=friendly; result=victory; duration=120; starPlayer=; teams=System.Object[]}
      20220602T062245.000Z @{id=0; map=}                                    @{mode=bounty; type=friendly; result=victory; duration=120; starPlayer=; teams=System.Object[]}
      20220602T061942.000Z @{id=0; map=}                                    @{mode=bounty; type=friendly; result=defeat; duration=120; starPlayer=; teams=System.Object[]}
      20220602T061704.000Z @{id=15000531; mode=brawlBall; map=Extra Bouncy} @{mode=brawlBall; type=friendly; result=victory; duration=32; starPlayer=; teams=System.Object[]}
      20220530T052241.000Z @{id=15000132; mode=brawlBall; map=Center Stage} @{mode=brawlBall; type=ranked; result=victory; duration=118; trophyChange=3; starPlayer=; teams=System.Object[]}
      20220530T051448.000Z @{id=15000132; mode=brawlBall; map=Center Stage} @{mode=brawlBall; type=ranked; result=victory; duration=28; trophyChange=3; starPlayer=; teams=System.Object[]}
      20220530T050909.000Z @{id=15000132; mode=brawlBall; map=Center Stage} @{mode=brawlBall; type=ranked; result=victory; duration=65; trophyChange=3; starPlayer=; teams=System.Object[]}
      20220530T050218.000Z @{id=15000132; mode=brawlBall; map=Center Stage} @{mode=brawlBall; type=ranked; result=victory; duration=36; trophyChange=3; starPlayer=; teams=System.Object[]}
      20220530T045627.000Z @{id=15000132; mode=brawlBall; map=Center Stage} @{mode=brawlBall; type=ranked; result=victory; duration=90; trophyChange=3; starPlayer=; teams=System.Object[]}
      20220530T044741.000Z @{id=15000132; mode=brawlBall; map=Center Stage} @{mode=brawlBall; type=ranked; result=victory; duration=67; trophyChange=3; starPlayer=; teams=System.Object[]}
      20220530T044120.000Z @{id=15000132; mode=brawlBall; map=Center Stage} @{mode=brawlBall; type=ranked; result=victory; duration=45; trophyChange=3; starPlayer=; teams=System.Object[]}
      20220530T043503.000Z @{id=15000132; mode=brawlBall; map=Center Stage} @{mode=brawlBall; type=ranked; result=victory; duration=38; trophyChange=3; starPlayer=; teams=System.Object[]}
      20220530T042350.000Z @{id=15000132; mode=brawlBall; map=Center Stage} @{mode=brawlBall; type=ranked; result=victory; duration=120; trophyChange=3; starPlayer=; teams=System.Object[]}
      20220530T041903.000Z @{id=15000132; mode=brawlBall; map=Center Stage} @{mode=brawlBall; type=ranked; result=victory; duration=78; trophyChange=3; starPlayer=; teams=System.Object[]}
      20220530T041218.000Z @{id=15000132; mode=brawlBall; map=Center Stage} @{mode=brawlBall; type=ranked; result=victory; duration=67; trophyChange=3; starPlayer=; teams=System.Object[]}
      20220530T040459.000Z @{id=15000132; mode=brawlBall; map=Center Stage} @{mode=brawlBall; type=ranked; result=victory; duration=32; trophyChange=3; starPlayer=; teams=System.Object[]}
      20220530T035916.000Z @{id=15000132; mode=brawlBall; map=Center Stage} @{mode=brawlBall; type=ranked; result=victory; duration=150; trophyChange=3; starPlayer=; teams=System.Object[]}
      20220530T034611.000Z @{id=15000132; mode=brawlBall; map=Center Stage} @{mode=brawlBall; type=ranked; result=victory; duration=75; trophyChange=3; starPlayer=; teams=System.Object[]}
      20220530T034033.000Z @{id=15000132; mode=brawlBall; map=Center Stage} @{mode=brawlBall; type=ranked; result=victory; duration=106; trophyChange=3; starPlayer=; teams=System.Object[]}
      20220530T033405.000Z @{id=15000132; mode=brawlBall; map=Center Stage} @{mode=brawlBall; type=ranked; result=victory; duration=37; trophyChange=3; starPlayer=; teams=System.Object[]}
      20220530T032729.000Z @{id=15000132; mode=brawlBall; map=Center Stage} @{mode=brawlBall; type=ranked; result=victory; duration=88; trophyChange=3; starPlayer=; teams=System.Object[]}
      20220530T032226.000Z @{id=15000132; mode=brawlBall; map=Center Stage} @{mode=brawlBall; type=ranked; result=victory; duration=60; trophyChange=3; starPlayer=; teams=System.Object[]}
      20220530T031550.000Z @{id=15000132; mode=brawlBall; map=Center Stage} @{mode=brawlBall; type=ranked; result=victory; duration=63; trophyChange=3; starPlayer=; teams=System.Object[]}
      20220530T030021.000Z @{id=15000132; mode=brawlBall; map=Center Stage} @{mode=brawlBall; type=ranked; result=victory; duration=134; trophyChange=3; starPlayer=; teams=System.Object[]}
      20220530T025445.000Z @{id=15000132; mode=brawlBall; map=Center Stage} @{mode=brawlBall; type=ranked; result=victory; duration=85; trophyChange=3; starPlayer=; teams=System.Object[]}
.NOTES
   https://developer.brawlstars.com/#/documentation


#>

   [CmdletBinding()]
   Param (
      [Parameter(ValueFromPipeline)]
      [String]$PlayerTag,
      [uri]$Uri = "$Script:PlayersEndPoint/%23$PlayerTag/battlelog"
   )

   Process {
      #Tags are all upper case
      $PlayerTag = $PlayerTag.ToUpper()
      If ($PlayerTag -match "^#") {
         $PlayerTag = $PlayerTag -replace "^#", ""
         $Uri = "$Script:PlayersEndPoint/%23$PlayerTag/battlelog"
      }
      Write-Verbose "Player Tag is set to $PlayerTag"
      Invoke-BrawlRequest -uri $Uri
   }
}
