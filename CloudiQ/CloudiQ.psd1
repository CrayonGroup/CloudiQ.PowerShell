@{
    RootModule        = 'CloudiQ.psm1'
    ModuleVersion     = '1.0.0'
    GUID              = '84a3337c-3d0b-4483-bd52-d7cf06a3ab8b'
    Author            = @(
        'Crayon'
        'Roberth Strand'
    )
    CompanyName       = 'Crayon'
    Copyright         = 'The Cloud-iQ module is licensed under the GNU General Public License v3.0'
    Description       = 'Module to automate licensing through Crayon Cloud-iQ.'
    FunctionsToExport = @(
        "Connect-CloudiQ"
        # Organization
        "Get-CloudiQOrganization"
        # Subscription
        "Get-CloudiQSubscription"
        "Set-CloudiQSubscription"
    )
    CmdletsToExport   = ''
    VariablesToExport = ''
    AliasesToExport   = @(
        'ciqc'
        'ciqgo'
        'ciqgs'
        'ciqss'
    )
    PrivateData       = @{
        PSData = @{
            Prerelease   = 'alpha4'
            Tags         = @("Crayon", "Cloud-iQ", "CloudiQ", "license")
            ProjectUri   = 'https://github.com/CrayonGroup/Crayon.Cloud-iQ.PowerShell'
            ReleaseNotes = 'https://github.com/CrayonGroup/Crayon.Cloud-iQ.PowerShell/releases'
        }
    }
    HelpInfoURI       = 'https://github.com/CrayonGroup/Crayon.Cloud-iQ.PowerShell/docs'
}