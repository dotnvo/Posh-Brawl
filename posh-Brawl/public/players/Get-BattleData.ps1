Function Get-BattleData {
   <#
.Synopsis
   Get Battle Summary Data of last 25 games of player
.DESCRIPTION
   Get Battle Summary Data of last 25 games of player
.EXAMPLE
.NOTES
   https://developer.brawlstars.com/#/documentation
#>
   [CmdletBinding()]
   Param (
      [Parameter(ValueFromPipeline)]
      [String]$PlayerTag = $script:DefaultPlayerTag,
      [Switch]$IgnoreDraws
   )
   Begin {
      If ($Script:ConnnectionComplete -ne 1) {
         Write-Error -Message "Please run Connect-BrawlStars to configure your current session." -ErrorAction Stop
      }
      #Need to be build a complete dataset for calculations
      $PlayerName = (Get-Player -PlayerTag $PlayerTag).name
      $response = Get-BattleLog -PlayerTag $PlayerTag
      [PSCustomObject]$ModesPlayed = $response.battle | Group-Object Mode | Select-Object @{ Name = 'GamesPlayed'; Expression = { $_.Count } }, Name
      $RoyaleGames = $Response.Battle | Where-Object { ($_.mode -like "*Showdown*") -or ($_.mode -like "*Lonestar*") -or ($_.mode -like "*Takedown*") }
      If ($RoyaleGames) {
         #Games where there can be more than 1 entity that wins. In this case, we calculate a win if there's a postive change in trophies
         $RoyaleCount = $RoyaleGames.Count
         $RoyaleWins = $Royalegames | Where-Object -Property trophychange -GT 0
         $RoyaleDraws = $Royalegames | Where-Object -Property trophychange -EQ 0
         $RoyaleLosses = $Royalegames | Where-Object -Property trophychange -LT 0
      }
      $TotalGames = $response.count
      $Results = $response.battle.result
      $NonRoyaleWinCount = ($Results | Where-Object { $_ -eq "victory" }).count
      $WinCount = $NonRoyaleWinCount + $RoyaleWins.count
      $LoseCount = ($Results | Where-Object { $_ -eq "Defeat" }).count + $RoyaleLosses.count
      $DrawCount = ($Results | Where-Object { $_ -eq "draw" }).count + $RoyaleDraws.count
      $StarPlayerCount = ($response.battle.starplayer.tag | Where-Object { $_ -match "$PlayerTag" }).count
   }
   Process {
      switch ($IgnoreDraws) {
         { $IgnoreDraws } { 
            Write-Verbose -Message "Draws will be thrown out"
            If ($DrawCount) {
               $CalculatedGames = $TotalGames - $DrawCount
            }
            $Percentage = ($WinCount / $CalculatedGames) * 100
            # It's impossible to get Star Player when you lose, or if you are playing in a Royale so we focus on non royale wins
            $sTarPlayerPercentage = ($StarPlayerCount / $NonRoyaleWinCount) * 100
            $Final = [math]::Round($Percentage, 2)
            $StarPlayerFinal = [math]::Round($StarPlayerPercentage, 2)
            $Properties = [ordered]@{
               "Player"               = $PlayerName
               "PlayerTag"            = $PlayerTag
               "Wins"                 = $WinCount
               "RoyaleWins"           = $RoyaleWins.count
               "StarPlayerTotal"      = $StarPlayerCount
               "StarPlayerPercentage" = $StarPlayerFinal
               "Loses"                = $LoseCount
               "Draws"                = "Ignored"
               "WinPercent"           = $Final
               "TotalRoyaleGames"     = $RoyaleCount
               "TotalGames"           = $TotalGames
               "TotalGames(No Draws)" = $CalculatedGames
               "Modes"                = $ModesPlayed
            }
         }
         { (-not($IgnoreDraws)) } {
            If ($DrawCount) {
               Write-Verbose "Draws detected.."
               $Percentage = (($WinCount + (.5 * $DrawCount)) / $TotalGames) * 100
               $Final = [math]::Round($Percentage, 2)
            } Else {
               $Percentage = ($WinCount / $TotalGames) * 100
               $Final = [math]::Round($Percentage, 2)
            }
            $sTarPlayerPercentage = ($StarPlayerCount / ($NonRoyaleWinCount + $DrawCount)) * 100
            $StarPlayerFinal = [math]::Round($StarPlayerPercentage, 2)
            $Properties = [ordered]@{
               "Player"               = $PlayerName
               "PlayerTag"            = $PlayerTag
               "Wins"                 = $WinCount
               "RoyaleWins"           = $RoyaleWins.count
               "StarPlayerTotal"      = $StarPlayerCount
               "StarPlayerPercentage" = $StarPlayerFinal
               "Loses"                = $LoseCount
               "Draws"                = $DrawCount
               "WinPercent"           = $Final
               "TotalRoyaleGames"     = $RoyaleCount
               "TotalGames"           = $TotalGames
               "Modes"                = $ModesPlayed
            }
         }
      }
      New-Object  -TypeName PSCustomObject -Property $Properties
   }
}