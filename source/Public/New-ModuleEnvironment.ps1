function New-ModuleEnvironment {
    <#
        .Synopsis
            Creates a new module environment and saves any specified modules to it.

        .Example
            New-ModuleEnvironment "SimpleModule" -Module @(
                @{Name="Az"; RequiredVersion="2.1.0"}
                @{Name="Configuration"; RequiredVersion="1.4.0"}
            )

            # Creates 'SimpleModule' Module Environment, saves Az and Configuration to it
    #>
    [CmdletBinding()]
    param(
        # Name of the ModuleEnvironment
        [Parameter(Mandatory)]
        [string]$Name,

        # Module(s) to add to the environment
        [PSModuleInfo[]]$Module
    )
    end {
        # Create ModuleEnvironment
        $ModuleEnvironmentPath = Join-Path $script:BasePath $Name
        if (-not (Test-Path -Path $ModuleEnvironmentPath -PathType Container)) {
            $null = New-Item -Path $ModuleEnvironmentPath -ItemType Directory
        }

        # Add modules to ModuleEnvironment
        Update-ModuleEnvironment @PSBoundParameters

        # Set module environment
        if ($script:Default.SetOnCreation) {
            Set-ModuleEnvironment -Name $Name
        }
    }
}