$UrlBase = 'https://github.com/brechtsanders/winlibs_mingw/releases/download'
$UrlRelease = '10.2.0-11.0.0-9.0.0-r3'
$CRCType = 'sha256'

$packageName = 'winlibs'
$url = "$UrlBase/$UrlRelease/winlibs-i686-posix-dwarf-gcc-10.2.0-llvm-11.0.0-mingw-w64-8.0.0-r3.zip"
$url64 = "$UrlBase/$UrlRelease/winlibs-x86_64-posix-seh-gcc-10.2.0-llvm-11.0.0-mingw-w64-8.0.0-r3.zip"
$checksum = '074A132A0ECE92F0C0C2C1C07C4B2D8DA646836DA689FD94E5FE0154CD4EBDD1'
$checksum64 = 'B37A16D829B8CCFD14D9D76AD00A0219269B0EC3ED7F1D205AFD9FA93CF8EE2D'
$installDir = Split-Path -parent $MyInvocation.MyCommand.Definition

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