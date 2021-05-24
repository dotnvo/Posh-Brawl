
# UNDER CONSTRUCTION STILL

## Prerequisites

Powershell 7.1 or greater. Due do some additional functionality, I decided to require 7.1 for this module.
Since Brawl Stars API keys are extremely long, and `Get-Credential` password field is limited to 255 characters in the GUI that appears, Powershell 7.1 gets around this limitation, so we can use Windows DPAPI.


## Powershell Wrapper for Brawl Stars

### How to Install Module (Incomplete)

1. Perform a git clone of this repo to a local directory of your choice
```sh
git clone https://github.com/your_username_/Project-Name.git
```
2. Unzip and place module in  your PSModulePath. [Modifying the PSModulePath Installation Path](https://docs.microsoft.com/en-us/powershell/scripting/developer/module/modifying-the-psmodulepath-installation-path?view=powershell-7.1)
```ps
$env:PSModulePath -split ";"
```

### How to Import Module into current session (Incomplete)

1. No really, I will get to this sometime, I promise.
### How to Setup Environment (Incomplete)

1. Create an account and get a free Key (which stores your token) at [https://developer.brawlstars.com/](https://developer.brawlstars.com/). Record the IP Address(s) and name of the Key.
2. You'll need to encrypt the contents of an API Key `Get-Credential` and store that in a file using `Export-Clixml`. I'll go more into this later. If you have knowledge on how to do this, you'll be able to review the code and see what needs to happen. I'll provide instructions below as well.
```ps
    New-ConfigFile
```
3. Run the Connect-BrawlStars -ConfigPath .\PathtoJSON
```ps
    Connect-BrawlStars -ConfigPath "C:\Temp\MyAwesomeFile.JSON"
```
