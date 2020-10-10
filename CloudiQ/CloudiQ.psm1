# ------------- Cloud-iQ ------------- #
# Dot sourcing all available functions #
$functionTypes = @(
    '/'
    '/organization/'
    '/subscription/'
)

foreach ($function in $functionTypes) {
    Get-ChildItem -Name "*.ps1" -Path ($PSScriptRoot + "/functions" + $function) | ForEach-Object {
        . ($PSScriptRoot + "/functions" + $function + $_)
    }
}