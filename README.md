# Powershell Wrapper for Brawl Stars

### How to Install Module

2. Perform a git clone of this repo to a local directory of your choice
```sh
git clone https://github.com/your_username_/Project-Name.git
```
3. Unzip and place module in  your PSModulePath. [Modifying the PSModulePath Installation Path](https://docs.microsoft.com/en-us/powershell/scripting/developer/module/modifying-the-psmodulepath-installation-path?view=powershell-7.1)
```ps
$env:PSModulePath -split ";"
```

### How to Import Module into current session

### How to Setup Environment

1. Create an account and get a free API Key at [https://developer.brawlstars.com/](https://developer.brawlstars.com/)
2. You'll need to encrypt the contents of an API Key using Windows DPAPI and store that encrypted string in a JSON formatted file. Will provide instructions in the future for this
3. Import the module
3.. Run the Connect-BrawlStars -ConfigPath .\PathtoJSON
```ps
    Connect-BrawlStars -Token "C:\Temp\MyAwesomeFile.JSON"
