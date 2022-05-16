# RepoDownloader
**A simple module to clone repositories with requests.** 

# AuthToken
**Go to github.com/settings/tokens to generate a token.**

# UI
```lua
getgenv().AuthToken = "Auth Token Here"
loadstring(game:HttpGet("https://raw.githubusercontent.com/0zBug/RepoDownloader/main/UI.lua"))()
```

# Module
### Auth
**Sets the auth token in the module**
```html
<void> RepoDownloader:Auth(<string> Token)
```
### DownloadRepository
**Used to download a single repository to the workspace**
```html
<void> RepoDownloader:DownloadRepository(<string> Repository)
```
### DownloadRepositories
**Used to download all repositories by a user to the workspace**
```html
<void> RepoDownloader:DownloadRepositories(<string> User)
```
