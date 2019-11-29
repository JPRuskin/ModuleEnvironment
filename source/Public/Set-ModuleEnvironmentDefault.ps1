function Set-ModuleEnvironmentDefault {
    <#
        .Synopsis
            Sets module defaults for ModuleEnvironment

        .Example
            Set-ModuleEnvironmentDefault -Name Az_2.1.0 -Autorun

            # Automatically adds Az_2.1.0 to PSModulePath on module import

        .Example
            Set-ModuleEnvironmentDefault -Name @("Az_2.1.0","AzSupportModules") -Autorun:$false

            # Sets default ModuleEnvironment(s) as specified, but will not modify PSModulePath on module import.

        .Example
            Set-ModuleEnvironmentDefault -BasePath C:\Temp\Modules

            # Sets the path to store ModuleEnvironment(s) to C:\Temp\Modules
    #>
    [CmdletBinding()]
    param(
        # ModuleEnvironments to load by default
        [string[]]$Name,

        # The path to store ModuleEnvironment(s)
        [string]$BasePath,

        # If set, causes the module to modify PSModulePath on load
        [switch]$Autorun,

        # If set, sets newly created ModuleEnvironments to the only one on PSModulePath.
        [switch]$SetOnCreation
    )
    end {
        $Configuration = Import-Configuration

        foreach ($Key in $PSBoundParameters.GetEnumerator().Keys) {
            $Configuration.$Key = $PSBoundParameters[$Key]
        }

        $Configuration | Export-Configuration
    }
}