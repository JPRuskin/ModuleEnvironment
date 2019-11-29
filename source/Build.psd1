@{
    Prefix                   = @(
        "`$Script:Default = Import-Configuration"
    )
    Suffix                   = @(
        "if (`$Default.Autorun) { ImportModuleEnvironment }"
    )
    Path                     = "SimpleAzureModule.psd1"
    OutputDirectory          = "..\"
    VersionedOutputDirectory = $true
}