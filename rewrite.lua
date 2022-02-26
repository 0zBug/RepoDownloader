
local Headers = {
    ["Authorization"] = "TOKEN",
}

local function bytes(n)
    local s = tostring(math.floor(n))
    local s = string.sub(s, 1, ((#s - 1) % 3 ) + 1) .. ({" bytes", "Kb", "Mb", "GB", "TB"})[math.floor((#s - 1) / 3) + 1]
    if n == 1 then s = s:sub(1, #s-1) end
    return s
end

local function DownloadDirectory(Path, Directory)
    local Directory = game.HttpService:JSONDecode(syn.request({
        Url = Directory,
        Headers = Headers
    }).Body)

    table.sort(Directory, function(a, b)
        return a.type < b.type
    end)

    for _,File in next, Directory do
        if File.type == "file" then
            --print(File.name, "(" .. bytes(File.size) .. ")")
            writefile(Path .. "/" .. File.name, game:HttpGet(File.download_url))
        elseif File.type == "dir" then
            makefolder(Path .. "/" .. File.name)
            DownloadDirectory(Path .. "/" .. File.name, File.url)
        end
    end
end

local RepoDownloader = {}

function RepoDownloader:Auth(Key) -- Go to github.com/settings/tokens to generate a key
    Headers["Authorization"] = "TOKEN " .. Key
end

function RepoDownloader:DownloadRepository(Repository) -- Args: Repository (string) Example: "0zBug/RepoDownloader"
    makefolder(Repository)
    DownloadDirectory(string.format("https://api.github.com/repos/%s/contents", Repository))
end

function RepoDownloader:DownloadRepositories(User) -- Args: User (string) Example: "0zBug"
    local Repos = game:GetService("HttpService"):JSONDecode(syn.request({
        Url = string.format("https://api.github.com/users/%s/repos", User),
        Headers = Headers
    }).Body)

    for _,Repository in pairs(Repos) do
        makefolder(Repository.full_name)
        DownloadDirectory(Repository.full_name, Repository.url .. "/contents")
    end
end

return RepoDownloader
