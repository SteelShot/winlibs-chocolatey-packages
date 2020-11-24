$UrlBase = 'https://github.com/brechtsanders/winlibs_mingw/releases/download'
$UrlRelease = '10.2.0-11.0.0-9.0.0-r3'
$CRCType = 'sha256'

$packageName = 'winlibs-llvm-free'
$url = "$UrlBase/$UrlRelease/winlibs-i686-posix-dwarf-gcc-10.2.0-mingw-w64-8.0.0-r3.zip"
$url64 = "$UrlBase/$UrlRelease/winlibs-x86_64-posix-seh-gcc-10.2.0-mingw-w64-8.0.0-r3.zip"
$checksum = 'B329671BC95F7CD486BC3A40DB16C14F787355EE750554539C6396B136DCA699'
$checksum64 = '30DB4461D116B42D0A60A4A7ED76FD1F791F140A094B2C950EEC55771BE5173E'
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