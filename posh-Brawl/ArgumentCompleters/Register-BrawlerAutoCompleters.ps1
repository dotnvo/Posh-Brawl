$GetBrawlerIndexListSB = {
   param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameters)
   Get-BrawlerIndexList | Where-Object {
      $_ -like "*$wordToComplete*"
   } | ForEach-Object {
      "'$_'"
   }
   }
Register-ArgumentCompleter -CommandName Get-Brawler -ParameterName Name -ScriptBlock $GetBrawlerIndexListSB