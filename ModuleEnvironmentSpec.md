# ModuleEnvironment
A set of functions to handle Python-esque virtual environments in PowerShell.

## Requirements
Allows a user to:
- Save a set of modules into a folder
    - Add additional/updated modules into a given folder
- Add a folder (environment) into PSModulePath, stripping others from the default folder (accept multiple?)
- Should default to similar behaviour to the Azure build agent, e.g. store in C:\Modules\, such that Az / AzureRm specific modules can be stored and added at will

## Functions

### New-ModuleEnvironment
Creates a new folder in the specified location (from config), and adds specified modules to the folder.

### Set-ModuleEnvironment
Gracefully adds a given folder to the PSModulePath, stripping any additional ModuleEnvironments from PSModulePath.
Accepts multiple environment names, and adds them all?

### Update-ModuleEnvironment
Save hashtable of modules to given ModuleEnvironment (folder)

### Import-ModuleEnvironment
Imports any defaults from configuration. Is probably run on load?

### Set-ModuleEnvironmentDefault
Sets defaults in configuration

## Notes
Should possibly have additional functions specifically for AzureRm / Az?