# Define the file path
$file_path = "E:\DEV\GitHub\3ENTLEY-H0M3-LA3\README.md"

# Read the content of the file
$content = Get-Content -Path $file_path

# Initialize variables
$new_content = @()
$in_game_section = $false

# Process each line of the file
foreach ($line in $content) {
    # Add the current line to the new content
    $new_content += $line

    # Check if the line starts with a game heading (### )
    if ($line -match '^### ' -and $line -notmatch '^### Description') {
        $in_game_section = $true
    }

    # Check if the line starts with a playtime heading (#### Playtime:)
    elseif ($line -match '^#### Playtime:' -and $in_game_section) {
        # Add the Description heading
        $new_content += "#### Description:"
        $in_game_section = $false
    }
}

# Save the updated content back to the file
$new_content | Set-Content -Path $file_path

Write-Output "File updated successfully."
