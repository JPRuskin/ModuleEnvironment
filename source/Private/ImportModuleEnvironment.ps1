function ImportModuleEnvironment {
    <#
        .Synopsis
            Adds the default module environment(s)
    #>
    Set-ModuleEnvironment -Name $Script:Default.Name
}