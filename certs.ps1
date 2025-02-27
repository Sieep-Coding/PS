param (
    [string]$path = "C:/",
    [string]$LogFile = "C:/*.log"
)

if (-Not (Test-Path -Path $path))
{
    Write-Error "$path does not exist."
    exit 1
}

$certs = Get-ChildItem -Path $path -File -Include "*.cer", "*.crt", "*.pfx" -ErrorAction SilentlyContinue

if ($certs.Count -eq 0)
{
    Write-Error "There is no $cert at $path"
    exit 0
}

foreach ($cert in $certs)
{
    $subj = $cert.Subject
    $expiry = $cert.NotAfter
    Write-Output "Certificate: $subj"
    Write-Output "Expires: $expiry"
    Write-Output "------------------"
}

Write-Output "Check complete"