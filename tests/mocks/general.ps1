function Invoke-RestMethod {
    param (
        $Uri,
        $Method,
        $Headers,
        $Body
    )
}
Mock -CommandName Invoke-RestMethod -Verifiable -MockWith {
    [PSCustomObject]@{
        StatusCode  = 200
        AccessToken = 'AccessToken'
    }
}