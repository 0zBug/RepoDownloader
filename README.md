# RepoDownloader
A simple module to clone repositories with requests

Go to github.com/settings/tokens to generate your Token. (doesn't need any permissions)

# Module
```lua
RepoDownloader:Auth("User Token Here")

RepoDownloader:DownloadRepository("0zBug/RepoDownloader") -- Downloads this repository and writes it to workspace.
RepoDownloader:DownloadRepositories("0zBug") -- Downloads all my repositories and writes it to workspace.
```

# UI
```lua
getgenv().AuthToken = "User Token Here"
loadstring(game:HttpGet("https://raw.githubusercontent.com/0zBug/RepoDownloader/main/UI.lua"))()
```
