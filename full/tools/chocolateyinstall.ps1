# WinLibs' GitHub Release
$Release = "10.2.0-11.0.0-8.0.0-r5"

# ZipPackage's URL bits
$UrlBase = 'https://github.com/brechtsanders/winlibs_mingw/releases/download'
$32      = "i686-posix-dwarf"
$64      = "x86_64-posix-seh"
$vers    = $Release.Split('-')

# Checksum Type
$CRCType = 'sha256'

# ChocolateyZipPackage's bits
$packageName = 'winlibs'
$url         = "$UrlBase/$Release/winlibs-$32-gcc-$($vers[0])-llvm-$($vers[1])-mingw-w64-$($vers[2])-$($vers[3]).zip"
$url64       = "$UrlBase/$Release/winlibs-$64-gcc-$($vers[0])-llvm-$($vers[1])-mingw-w64-$($vers[2])-$($vers[3]).zip"
$checksum    = (([char[]](Invoke-WebRequest -Uri "$url.$CRCType" -UseBasicParsing).Content) -join '').Split(' ')[0]
$checksum64  = (([char[]](Invoke-WebRequest -Uri "$url64.$CRCType" -UseBasicParsing).Content) -join '').Split(' ')[0]
$installDir  = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
    packageName     = $packageName
    unzipLocation   = $installDir
    url             = $url
    url64           = $url64
    checksum        = $checksum
    checksum64      = $checksum64
    checksumType    = $CRCType
    checksumType64  = $CRCType
}

Install-ChocolateyZipPackage @packageArgs