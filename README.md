#Powershell Wrapper for Brawl Stars

## Getting Started

This is an example of how you may give instructions on setting up your project locally.
To get a local copy up and running follow these simple example steps.

### Prerequisites

This is an example of how to list things you need to use the software and how to install them.
* npm
```sh
npm install npm@latest -g
```

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
2. Run the Connect-BrawlStars function and pass it the proper Token
```ps
    Connect-Brawl -Token "xyz"
