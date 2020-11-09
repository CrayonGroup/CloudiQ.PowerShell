BeforeAll {
    # Import module
    Import-Module -Name "$PSScriptRoot/../CloudiQ/CloudiQ.psd1" -Force -ErrorAction Stop
    . "$PSScriptRoot/mocks/agreement.ps1"
}

Describe 'get agreements' {
    It 'should return a list of agreements' {
        $agreements = Get-CloudiQAgreement

        $agreements.count | Should -Be 2
    }
    It 'should return a list of agreements, with detail' {
        $agreements = Get-CloudiQAgreement -Detailed

        $agreements.count | Should -Be 2

        $agreements[0].Organization.Name | Should -Be 'Crayon'
    }
}