Function Connect-BrawlStars {
   <#
.SYNOPSIS
   Establishes Connection to Brawl Stars API.
.DESCRIPTION
   Establishes Connection to Brawl Stars API.
.PARAMETER KeyFile
   Specifies the key file which contains the token needed for authentication against the endpoints.
      -Default KeyFile is set $Script:DefaultKeyFile, found in $Script:KeysDirectory
      -Default originally set in PSM1 File. if specified, this function overrides it
      -If you want to use a different token, specify entire path E.G.:
      C:\Users\username\Documents\MyLittleSecret.Secret
.EXAMPLE
   Connect-BrawlStars

   Connection Successful.
.NOTES
   https://developer.brawlstars.com/#/getting-started
#>

   [CmdletBinding()]
   Param (
      [String]$KeyFile = "$Script:DefaultKeyFile"
   )

   Process {
      If (Test-Path -Path $KeyFile) {
         Write-Verbose -Message "$Keyfile found..."
         Try {
            $Creds = Import-Clixml -Path $KeyFile
            $Token = $creds.Password | ConvertFrom-SecureString -AsPlainText -ErrorAction Stop
         } Catch [System.Security.Cryptography.CryptographicException] {
            Write-Error -Exception (System.Security.Cryptography.CryptographicException]::new("Unable to decrypt Credentials. Please generate new credentials file or specify a new KeyFile.")) -ErrorAction Stop
         }
      } Else {
         Write-Verbose -Message "`$KeyFile not specified. Trying to find another Key to use..."
         $Keys = Get-ChildItem -Path "$Script:KeysDirectory\*" -Include *.Secret
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
      $Response = Invoke-BrawlRequest -URI $script:BaseURI
      Write-Verbose -Message "$Reponse"

      If (-not ($Response.Reason)) {
         Write-Output "Connection Successful."
      }

   }
}
