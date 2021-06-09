Function Get-Player {
   <#
.Synopsis
   Get information about a single player by player tag
.DESCRIPTION
   Get information about a single player by player tag
.EXAMPLE
   Get-Player -PlayerTag #C08UC2C
.NOTES
   https://developer.brawlstars.com/#/documentation


#>

   [CmdletBinding(DefaultParameterSetName = 'PlayerTag')]
   Param (
      [Parameter(ValueFromPipeline, ParameterSetName = 'PlayerTag')][ValidatePattern('[#0289PYLQGRJCUV]')]
      [String[]]$PlayerTags = $script:DefaultPlayerTag,
      [Parameter(ParameterSetName = 'PlayerName')]
      [ArgumentCompleter(
         {
            param($Command, $Parameter, $WordToComplete, $CommandAst, $FakeBoundParams)
            $BrawlAutoCompletePlayers
         }
      )]
      [ValidateScript(
         {
            $_ -in ($BrawlConfig.FavoritePlayers.PlayerName)
         }
      )]
      [String]$Name,
      [Switch]$BestBrawler
   )
   Begin {
      If ($Script:ConnnectionComplete -ne 1) {
         Write-Error -Message "Please run Connect-BrawlStars to configure your current session." -ErrorAction Stop
      }
   }
   Process {
      Write-Verbose -Message "ParameterSetName : $($PSCmdlet.ParameterSetName)"
      switch ($PSCmdlet.ParameterSetName) {
         PlayerTag {
            ForEach ($PlayerTag in $PlayerTags) {
               #Tags are all upper case
               $PlayerTag = $PlayerTag.ToUpper()
               If ($PlayerTag -match "^#") {
                  $PlayerTag = $PlayerTag -replace "^#", ""
                  $Uri = "$Script:PlayersEndPoint/%23$PlayerTag"
               }
               Write-Verbose "Player Tag is set to $PlayerTag"
               $Response = Invoke-BrawlRequest -URI $URI
               If ($BestBrawler) {
                  $Maximum = ($Response.brawlers.highesttrophies | Measure-Object -Maximum).Maximum
                  $HighestBrawler = $Response.Brawlers | Where-Object { $_.HighestTrophies -eq $Maximum }
                  $Response | Add-Member -NotePropertyName bestbrawler -NotePropertyValue $HighestBrawler
               }
               $Response
            }
         }
         PlayerName {
            $PlayerTag = ($BrawlConfig.favoriteplayers | Where-Object { $_.Playername -eq $Name }).PlayerTag
            $PlayerTag = $PlayerTag.ToUpper()
            If ($PlayerTag -match "^#") {
               $PlayerTag = $PlayerTag -replace "^#", ""
            }
            $Uri = "$Script:PlayersEndPoint/%23$PlayerTag"
            Write-Verbose "Player Tag is set to $PlayerTag"
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
