@{
    ModuleVersion     = '0.1.0'

    # Modules that must be imported into the global environment prior to importing this module
    RequiredModules   = @(
        'Configuration'
    )

    # Exports. Populated by Optimize-Module during the build step.
    # For best performance, do not use wildcards and do not delete these entry!
    # Use an empty array if there is nothing to export.
    FunctionsToExport = @()
    CmdletsToExport   = @()
    AliasesToExport   = @()

    # Third party metadata
    PrivateData       = @{
        # PowerShell Gallery data
        PSData = @{
            Prerelease   = ''
            ReleaseNotes = ''
            Tags         = 'Build', 'Development'
            ProjectUri   = 'https://github.com/jpruskin/ModuleEnvironment'
        }
    }

    # ID used to uniquely identify this module
    GUID              = 'a1bc7928-d155-4128-bd31-82ec1502b9bd'
    Description       = 'Module to add a saved module from C:\Modules, as the AzureDevOps build machines seem to.'
    Author            = 'jpruskin'

    # The main script or binary module that is automatically loaded as part of this module
    RootModule        = 'ModuleEnvironment.psm1'

    # Minimum version of the Windows PowerShell engine tested with this module
    PowerShellVersion = '5.1'
}