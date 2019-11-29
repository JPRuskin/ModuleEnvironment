function Set-ModuleEnvironment {
    <#
        .Synopsis
            Ensures that the specified ModuleEnvironment(s), and no other, are on PSModulePath

        .Example
            Set-ModuleEnvironment Az_2.1.0

            # Adds the listed ModuleEnvironment to PSModulePath, removing all other ModuleEnvironments

        .Example
            Set-ModuleEnvironment -Path @("C:\Temp\TestModule", "C:\Modules\Az_2.1.0")

            # Adds the listed folders to PSModulePath, removing all other ModuleEnvironment(s)

        .Example
            Add-ModuleEnvironment SimpleModules  # or Set-ModuleEnvironment -Add -Name SimpleModules

            # Adds the listed ModuleEnvironment, without removing other ModuleEnvironment(s)
    #>
    [Alias('Add-ModuleEnvironment')]
    [CmdletBinding(DefaultParameterSetName = "Calculated")]
    param(
        # ModuleEnvironment to add to PSModulePath
        [Parameter(ParameterSetName = "Calculated", Position = 0)]
        [string[]]$Name = $Script:Default.Name,

        # Paths to add to PSModulePath
        [Parameter(ParameterSetName = "Provided", Position = 0)]
        [ValidateScript( { Test-Path $_ -PathType Container })]
        [string[]]$Path = @($Name.ForEach{ "$($Script:Default.BasePath)\$_" }),

        # If set, will not remove other paths matching $BasePath
        [switch]$Add = $($PSCmdlet.MyInvocation.InvocationName -eq 'Add-ModuleEnvironment')
    )
    end {
        if (-not (Test-Path $Path)) {
            Save-AzureModule -Name $Name -RequiredVersion $Version
        }

        $ModulePath = $env:PSModulePath.Split(';')
        $env:PSModulePath = @() + $Path + $ModulePath.Where(
            $(if ($Add) {
                { $_ -notin $Path }
            } else {
                { $_ -notlike "$($Script:Default.BasePath)\*" }
            })
        ) -join ';'
    }
}