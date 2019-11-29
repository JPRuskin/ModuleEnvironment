function Update-ModuleEnvironment {
    <#
        .Synopsis
            Creates a new module environment and saves any specified modules to it.

        .Example
            Update-ModuleEnvironment "SimpleModule" -Module @(
                @{Name="Az"; RequiredVersion="2.1.0"}
                @{Name="Configuration"; RequiredVersion="1.4.0"}
            )

            # Saves Az and Configuration to the SimpleModule environment
    #>
    [CmdletBinding()]
    param(
        # Name of the ModuleEnvironment
        [Parameter(Mandatory)]
        [string]$Name,

        # Module(s) to add to the environment
        [Parameter(Mandatory, ValueFromPipeline)]
        [PSModuleInfo[]]$Module
    )
    begin {
        $ModuleEnvironment = Join-Path $script:Defaults.BasePath $Name
    }
    process {
        foreach ($Module in $Module) {
            Write-Verbose "Saving '$($Module)' and dependencies to '$($ModuleEnvironment)'"
            Save-Module @Module -Path $ModuleEnvironment
        }
    }
}