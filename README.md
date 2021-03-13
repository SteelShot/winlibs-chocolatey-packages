# winlibs-chocolatey-packages
Repository for hosting WinLibs Chocolatey packages.

[WinLibs](https://chocolatey.org/packages/winlibs)

[WinLibs without LLVM](https://chocolatey.org/packages/winlibs-llvm-free)

# Why the big versioning change?
Previous chocolatey packages were trying to match versioning of official WinLibs' versioning.
Honestly that was a complete pile of sh*t and a mess to do! 

If a WinLibs package had a hotfix version release i.e Release-X (Hotfix Y), 
due to chocolatey not allowing semantic 2.0.0 uncomliant versioning(Which is fine, there has to be conistency),
the chocolatey packages' versioning was unable to follow WinLibs' versioning.

# How to **currently** match WinLibs' versioning with Chocolatey packages' versioning?
This time it is simplyfied. The MAJOR.MINOR.PATCH versioning will follow WinLibs' GCC -> LLVM (is applicable) -> MinGW-w64 release format.
The .PATCH label will be used for the Chocolatey package.

For the actual release and full WinLibs' component versions, you will need to check the Release Notes under the Chocolatey package or check the releases page in this repository. They will be linked WinLibs' GitHub releases page

You can checkout more about these labels under [semantic versioning 2.0.0](https://semver.org/spec/v2.0.0.html)

### Example 10.11.8.0
- Major GCC version is 10
- Major LLVM version is 11
- Major MinGW-w64 version is 8
- 0 corresponds to chocolatey packages' build number

### Example 10.8.0 (llvm-free package)
- Major GCC version is 10
- Major MinGW-w64 version is 8
- 0 corresponds to chocolatey packages' build number