$("mingw32", "mingw64") | ForEach-Object {
    $PathToDelete = Split-Path -parent $MyInvocation.MyCommand.Definition
    $PathToDelete = "$PathToDelete\$_\bin"

    if (Test-Path -Path $PathToDelete) {
        foreach ($path in [System.Environment]::GetEnvironmentVariable("Path", [System.EnvironmentVariableTarget]::Machine).split(';')) {
            If ($path) {
                If (($path -ine "$PathToDelete") -AND ($path -ine "$PathToDelete\")) {
                    [string[]]$Newpath += "$path"
                }
            }
        }
        $AssembledNewPath = ($newpath -join (';')).trimend(';')
        
        Write-Output $AssembledNewPath
        
        [System.Environment]::SetEnvironmentVariable("Path", $AssembledNewPath, [System.EnvironmentVariableTarget]::Machine)
    }
}