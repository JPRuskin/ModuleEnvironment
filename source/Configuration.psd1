@{
    # The path to store modules in
    BasePath = Join-Path $env:HOMEDRIVE "Modules"

    # Default ModuleEnvironment to add to PSModulePath
    Name     = "Az_2.1.0"
    # Version  = "2.1.0"

    # If set, will automatically add the configured default on load
    Autorun  = $false

    # If set, will automatically add newly created environments
    SetOnCreation = $false
}