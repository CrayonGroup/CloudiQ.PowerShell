BeforeAll {
    # Import module
    Import-Module -Name "$PSScriptRoot/../CloudiQ/CloudiQ.psd1" -Force -ErrorAction Stop
    . "$PSScriptRoot/mocks/organizations.ps1"
}

Describe 'test Organizations' {
    It 'Should result in listing four demo customers' {
        $Organizations = Get-CloudiQOrganization
        $Organizations.count | Should -be 4
    }

    It 'Should show only the two organizations using EUR' {
        $Organizations = Get-CloudiQOrganization -Name "EUR"
        $Organizations.count | Should -be 2
        $Organizations.Name | Should -Be "Demo Customer [T1/EUR]", "Demo Customer [T2/EUR]"
    }
}