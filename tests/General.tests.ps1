BeforeAll {
    # Import module
    Import-Module -Name "$PSScriptRoot/../CloudiQ/CloudiQ.psd1" -Force -ErrorAction Stop
    . "$PSScriptRoot/mocks/general.ps1"
}

Describe 'tests connecting to the api' {
    It 'should return the access token' {
        New-Item -Path 'Env:' -Name 'CloudiQUsername' -Value 'Pester' -Force
        New-Item -Path 'Env:' -Name 'CloudiQPassword' -Value 'PesterPass' -Force

        New-Item -Path 'Env:' -Name 'CloudiQClientId' -Value 'PesterClientId' -Force
        New-Item -Path 'Env:' -Name 'CloudiQClientSecret' -Value 'PesterClientSecret' -Force
        Connect-CloudiQ | Out-Null
        
        $CloudIqAccessToken | Should -Be 'AccessToken'
    }

    it 'should fail to connect' {
        { Connect-CloudiQ -ClientId 'BadRequest' -ClientSecret 'BadRequest' -ErrorAction Stop } | Should -Throw
    }
}