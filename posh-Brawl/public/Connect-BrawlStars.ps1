Function Connect-BrawlStars {
<#
.SYNOPSIS
   Short description
.DESCRIPTION
   Long description
.PARAMETER ConfigFile
   Specifies the configuration file path
      -Default Configuration path is $Script:moduleBase\Configs
      -Default originally set in PSM1 File. if specified, this function overrides it
      -If you want to use a different config file, specify entire path E.G.:
      C:\Users\username\Documents\Config.json
.PARAMETER KeyFile
   Specifies the key file which contains the token needed for authentication against the endpoints.
      -Default KeyFile is set $Script:DefaultKeyFile, found in $Script:KeysDirectory
      -Default originally set in PSM1 File. if specified, this function overrides it
      -If you want to use a different token, specify entire path E.G.:
      C:\Users\username\Documents\MyLittleSecret.Secret
.EXAMPLE
   Connect-BrawlStars
   Connects with default settings. if successful, return is:
   Connection Successful. API contains a valid token
.INPUTS
   
.OUTPUTS
   
.NOTES
   https://developer.brawlstars.com/#/getting-started
#>

   [CmdletBinding()]
   Param (
      [String]$Script:ConfigFile = "$Script:DefaultConfig",
      [String]$Script:KeyFile = "$Script:DefaultKeyFile"
   )

   Begin {
      $Config = Get-Content -Path $ConfigFile | ConvertFrom-Json
      $script:DefaultPlayerTag = $Config.Defaults.DefaultPlayerTag
   }
   Process {
      If (Test-Path -Path $KeyFile) {
         Write-Verbose -Message "$Keyfile found..."
         Try {
            $Creds = Import-Clixml -Path $KeyFile
            $Token = $creds.Password | ConvertFrom-SecureString -AsPlainText -ErrorAction Stop
         } Catch [System.Security.Cryptography.CryptographicException] {
            Write-Error -Exception (System.Security.Cryptography.CryptographicException]::new("Unable to decrypt Credentials. Please generate new credentials file or specify a new KeyFile.")) -ErrorAction Stop         }
      } Else {
         Write-Verbose -Message "`$KeyFile not specified. Trying to find another Key to use..."
         $Keys = Get-ChildItem -Path  "$Script:KeysDirectory\*" -Include *.Secret
         If ($Keys) {
            Write-Verbose -Message "Found files, selecting most recently modified..."
            $KeyFile = $Keys | Sort-Object -Descending LastWriteTime | Select-Object -First 1
            Try {
               $Creds = Import-Clixml -Path $KeyFile -ErrorAction Stop
               $Token = $creds.Password | ConvertFrom-SecureString -AsPlainText
            } Catch [System.Security.Cryptography.CryptographicException] {
               Write-Error -Exception ([System.Security.Cryptography.CryptographicException]::new("Unable to decrypt Credentials. Please generate new credentials file or specify a new KeyFile.")) -ErrorAction Stop
            }
         } Else {
            throw "No valid key files found, please create one manually or generate one with New-BrawlKeyFile"
         }
         
      }
      $Script:headers = @{
         authorization = "Bearer $token"
      }
      Invoke-BrawlRequest -URI $BaseURI
      <#
      Invoke-RestMethod -Method Get -Uri $BaseURI -Headers $Script:headers -StatusCodeVariable StatusCode | Out-Null
      if ($StatusCode -eq "200") {
         Write-Host "Connection Successful. $($Creds.Username) contains a valid token"
         $Script:ConnectionComplete = 1
         $Config
      } Else {
         $statuscode
      }
      #>
   }
}