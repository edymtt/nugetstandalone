Nuget Standalone
=============
This little sample shows how to use `Nuget.exe` to install packages and update them, without having a Visual C#/Basic/F# project. In particular, in this sample I download NUnit 2.6.1 then I update it (to at least version 2.6.2), making sure that in the end I have in the project folder only the latest version.

1. Download `Nuget.exe` from http://nuget.codeplex.com/releases/view/58939
2. Make sure that `Nuget.exe` is in the repo folder or in the PATH
3. open a Powershell prompt
4. invoke `install.ps1`. NUnit will be installed and updated in the `packages` folder

Quick explanation
-----------------
The installation works out of the box, just by having the `packages.config` file -- `nuget install`will download the library version specified in it.

The update is a little tricky -- we have to let `Nuget` think that it is updating a project, otherwise the update will not start. To achieve this, we insert an empty `csproj` file.

Finally, to have a clean `packages` folder (with only the latest version of NUnit) I simply delete the folder and repeat the installation -- the update has changed `packages.config` to point to the latest version of the library, so the install will grab it directly (copying it from local and not downloading it again).