# Set the output directory
$outputDir = "C:\Temp"

# Check if C:\Temp exists; if not, create it
if (-Not (Test-Path -Path $outputDir)) {
    New-Item -Path $outputDir -ItemType Directory | Out-Null
}

# Get the computer name
$computerName = $env:COMPUTERNAME

# Get local administrators
$admins = Get-LocalGroupMember -Group "Administrators"

# Set the output file path
$outputFile = Join-Path -Path $outputDir -ChildPath "Local_Admins.txt"

# Write header
"Local Administrators on: $computerName" | Out-File -FilePath $outputFile
"----------------------------------------" | Out-File -FilePath $outputFile -Append

# Write list of admins
$admins | ForEach-Object {
    $_.Name
} | Out-File -FilePath $outputFile -Append

# Optional: open the file after creation
# notepad.exe $outputFile
