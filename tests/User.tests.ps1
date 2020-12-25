BeforeAll {
    # Import module
    Import-Module -Name "$PSScriptRoot/../CloudiQ/CloudiQ.psd1" -Force -ErrorAction Stop
    . "$PSScriptRoot/mocks/user.ps1"
}

Describe 'Running get commands on users' {
    It 'Should return all users' {
        $users = Get-CloudiQUser

        $users.count | Should -Be 2
    }
    It 'Should return all user of type user' {
        $user = Get-CloudiQUser -Role User

        $user.count | Should -Be 1
        $user.FirstName | Should -Be 'Default'
    }
    It 'Should return all users of type admin' {
        $user = Get-CloudiQUser -Role Admin

        $user.count | Should -Be 1
        $user.FirstName | Should -Be 'Admin'
    }
    It 'Should return a user based on username' {
        $user = Get-CloudiQUser -Username 'admin.user.name@cloudiq.crayon.com'

        $user.count | Should -Be 1
        $user.username | Should -Be 'admin.user.name@cloudiq.crayon.com'
    }
    It 'Should return a user based on Id' {
        $user = Get-CloudiQUser -Id 'e44e45d4-9798-4987-8762-6da02de5e3b5'

        $user.count | Should -Be 1
        $user.username | Should -Be 'admin.user.name@cloudiq.crayon.com'
    }
}