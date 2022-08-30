$hashes = @()
if (!$files)
{
    $files = (gci -force -Recurse -Path \ -ErrorAction SilentlyContinue).fullname
} # Designed to save time, if the var already exists, don't waste time refilling it.  Script will still take quite a bit of time.
if (!$hashes)
{
    Write-Host -ForegroundColor Red "Please add hashes to the hashes variable."
    Return
} # If there are no hashes, end the program and tell the user to add to the variable.
$noMatchFound = $true
foreach ($hash in $hashes)
{
    Write-Host "Checking $hash"
    foreach ($file in $files)
    {
        if ($(Get-FileHash -Algorithm MD5 $file -ErrorAction SilentlyContinue).hash -imatch $hash)
        {
            Write-host -ForegroundColor Magenta $file
            $noMatchFound = $false

        }
    }
}
if ($noMatchFound)
{
    Write-Host -ForegroundColor Green "No matching hashes"
}
