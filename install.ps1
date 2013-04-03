$destinationFolder = "packages"
if (!(Test-Path -path $destinationFolder)) {New-Item $destinationFolder -Type Directory}
nuget install packages.config -o packages