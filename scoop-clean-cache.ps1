# Set how many versions to keep
$VersionsToKeep = 0
$AppDir = "$HOME\\scoop\\apps"
$CacheDir = "$HOME\\scoop\\cache"

# Get installed app directories
$InstalledDirs = Get-ChildItem $AppDir -Directory | ForEach-Object { $_.Name }

# Get all cache files
$CacheFiles = Get-ChildItem $CacheDir

# For each app, if not installed, clean up its cache (keep X most recent, delete the rest)
$AppCacheGroups = $CacheFiles | Group-Object { $_.BaseName.Split('#')[0] }
foreach ($group in $AppCacheGroups) {
    $app = $group.Name
    if ($InstalledDirs -notcontains $app) {
        $files = $group.Group | Sort-Object LastWriteTime -Descending
        $filesToDelete = $files | Select-Object -Skip $VersionsToKeep
        $NamesToDelete = $filesToDelete | ForEach-Object { $_.BaseName + $_.Extension }
        Write-Host "Deleting cache of ${app}: [$NamesToDelete]"
        $filesToDelete | Remove-Item -Force
    }
}
