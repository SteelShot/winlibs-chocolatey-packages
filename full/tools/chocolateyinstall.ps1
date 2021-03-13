# WinLibs' GitHub Release
$Release = "10.2.0-11.0.0-8.0.0-r8"

# ZipPackage's URL bits
$UrlBase = "https://github.com/brechtsanders/winlibs_mingw/releases/download"
$32 = "i686-posix-dwarf"
$64 = "x86_64-posix-seh"
$vers = $Release.Split("-")

# Checksum Type
$CRCType = "sha256"

# ChocolateyZipPackage's bits
$packageName = "winlibs"
$url = "$UrlBase/$Release/winlibs-$32-gcc-$($vers[0])-llvm-$($vers[1])-mingw-w64-$($vers[2])-$($vers[3]).zip"
$url64 = "$UrlBase/$Release/winlibs-$64-gcc-$($vers[0])-llvm-$($vers[1])-mingw-w64-$($vers[2])-$($vers[3]).zip"
$checksum = "762724247fdb72801493edc3fde6bd0ff2f3f362bbf72d638fd70b0b429098b0"
$checksum64 = "daed519d268e7a50b1ccbe169932068be7e55ee0b02a849dd410aabc0b46f134"
$installDir = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
    packageName    = $packageName
    unzipLocation  = $installDir
    url            = $url
    url64          = $url64
    checksum       = $checksum
    checksum64     = $checksum64
    checksumType   = $CRCType
    checksumType64 = $CRCType
}

Install-ChocolateyZipPackage @packageArgs

# Add binary directory to path & ignore shim generation
$("mingw32", "mingw64") | ForEach-Object {
    $path = (Join-Path "$installDir" (Join-Path $_ "bin"))

    If (Test-Path $path) {
        $files = Get-ChildItem (Split-Path -Path $path -Parent) -Include *.exe -Recurse

        foreach ($file in $files) {
            # SANITY CHECK: No need to regenerate .ignore files if they already exist
            if (!(Test-Path "$file.ignore")) {
                New-Item "$file.ignore" -ItemType File -Force | Out-Null
            }
        }

        Install-ChocolateyPath -PathToInstall $path -PathType "Machine"
    }
}