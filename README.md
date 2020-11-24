# winlibs-chocolatey-packages
Repository for hosting WinLibs Chocolatey packages.

[WinLibs](https://chocolatey.org/packages/winlibs)

[WinLibs without LLVM](https://chocolatey.org/packages/winlibs-llvm-free)

# Why the weird choco versioning?
- Chocolatey does not allow for composite semantic versions like 10.2.0-11.0.0-8.0.0-3 or custom strings as versions
- WinLibs does not use a single non composite semantic version

The versioning is composed of all 4 components of WinLibs (Apart llvm-free package as it has no LLVM bundled: 3 parts)

Each official non pre-release build of WinLibs contains a unique name like: 

> **GCC 10.2.0 + LLVM/Clang/LLD/LLDB 11.0.0 + MinGW-w64 8.0.0 - release 3**


This build corresponds to the 1st example given below. To be sure which component versions are used as these versions can be amiguous.
(**1020 does not mean that it is 10.2.0 as it also could be 1.0.20 or 1.20.0**) check with the official resources below.
- [WinLibs Github releases page](https://github.com/brechtsanders/winlibs_mingw/releases)
- [WinLibs website's downloads](http://winlibs.com/#download-release)

The choco version order will always follow WinLib's build names: GCC -> LLVM (if applicable) -> MinGW-w64 -> Release, unless WinLibs it changes them!

### Example 1020.1100.800.3
- GCC version is 10.2.0
- LLVM version is 11.0.0
- MinGW-w64 version is 8.0.0
- Release 3

### Example 1020.800.3 (LLVM Free)
- GCC version is 10.2.0
- MinGW-w64 version is 8.0.0
- Release 3
