# RepoDownloader
A simple module to clone repositories with requests
```lua
RepoDownloader:Auth("User Token Here") -- Go to github.com/settings/tokens to generate a key. (doesn't need any permissions)

RepoDownloader:DownloadRepository("0zBug/RepoDownloader") -- Downloads this repository and writes it to workspace.
RepoDownloader:DownloadRepositories("0zBug") -- Downloads all my repositories and writes it to workspace.
```
