
local AuthToken = "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"

local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local DownloadFrame = Instance.new("Frame", ScreenGui)
DownloadFrame.AnchorPoint = Vector2.new(0.5, 0.5)
DownloadFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DownloadFrame.Position = UDim2.fromScale(0.5, 0.5)
DownloadFrame.Size = UDim2.fromScale(0.25, 0.1)
DownloadFrame.Visible = false

local UICorner = Instance.new("UICorner", DownloadFrame)
UICorner.CornerRadius = UDim.new(0, 6)

local UIGradient = Instance.new("UIGradient", DownloadFrame)
UIGradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 11, 19)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(38, 38, 38)),
})
UIGradient.Rotation = 90

local Stroke = Instance.new("Frame", DownloadFrame)
Stroke.AnchorPoint = Vector2.new(0.5, 0.5)
Stroke.BackgroundColor3 = Color3.fromRGB(0, 11, 19)
Stroke.BackgroundTransparency = 1
Stroke.Position = UDim2.fromScale(0.5, 0.5)
Stroke.Size = UDim2.fromScale(0.99, 0.95)

local UIStroke = Instance.new("UIStroke", Stroke)
UIStroke.Color = Color3.fromRGB(53, 53, 53)

local UICorner1 = Instance.new("UICorner", Stroke)
UICorner1.CornerRadius = UDim.new(0, 6)

local DownloadBar = Instance.new("Frame", DownloadFrame)
DownloadBar.AnchorPoint = Vector2.new(0.5, 0.5)
DownloadBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DownloadBar.Position = UDim2.fromScale(0.5, 0.5)
DownloadBar.Size = UDim2.fromScale(0.9, 0.15)

local UICorner2 = Instance.new("UICorner", DownloadBar)

local DownloadGradient = Instance.new("UIGradient", DownloadBar)

local Colors = {
	[1] = Color3.fromRGB(69, 252, 145),
	[2] = Color3.fromRGB(15, 154, 85)
}

game:GetService("RunService").RenderStepped:Connect(function()
	local Sequence = {}
	
	for i = 1, 4 do
		table.insert(Sequence, ColorSequenceKeypoint.new(((i / 4) + (os.clock() / 5)) % 1, Colors[i % 2 + 1]))
	end
	
	table.insert(Sequence, ColorSequenceKeypoint.new(0, (Sequence[1].Value):lerp(Sequence[1].Value, Sequence[1].Time - 0.33)))
	table.insert(Sequence, ColorSequenceKeypoint.new(1, (Sequence[4].Value):lerp(Sequence[4].Value, Sequence[4].Time - 0.33)))
	
	table.sort(Sequence, function(a, b)
		return a.Time < b.Time
	end)
	
	DownloadGradient.Color = ColorSequence.new(Sequence)
end)

local FileStatus = Instance.new("TextLabel", DownloadFrame)
FileStatus.Font = Enum.Font.SourceSans
FileStatus.Text = "Fetching Files.."
FileStatus.TextColor3 = Color3.fromRGB(255, 255, 255)
FileStatus.TextSize = 14
FileStatus.TextXAlignment = Enum.TextXAlignment.Left
FileStatus.TextYAlignment = Enum.TextYAlignment.Bottom
FileStatus.AnchorPoint = Vector2.new(0.5, 0.5)
FileStatus.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FileStatus.BackgroundTransparency = 1
FileStatus.Position = UDim2.fromScale(0.3, 0.3)
FileStatus.Size = UDim2.fromScale(0.5, 0.2)

local PercentageStatus = Instance.new("TextLabel", DownloadFrame)
PercentageStatus.Font = Enum.Font.SourceSans
PercentageStatus.Text = ""
PercentageStatus.TextColor3 = Color3.fromRGB(255, 255, 255)
PercentageStatus.TextSize = 14
PercentageStatus.TextXAlignment = Enum.TextXAlignment.Left
PercentageStatus.TextYAlignment = Enum.TextYAlignment.Top
PercentageStatus.AnchorPoint = Vector2.new(0.5, 0.5)
PercentageStatus.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PercentageStatus.BackgroundTransparency = 1
PercentageStatus.Position = UDim2.fromScale(0.3, 0.7)
PercentageStatus.Size = UDim2.fromScale(0.5, 0.2)

local InputFrame = Instance.new("Frame", ScreenGui)
InputFrame.AnchorPoint = Vector2.new(0.5, 0.5)
InputFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
InputFrame.Position = UDim2.fromScale(0.5, 0.5)
InputFrame.Size = UDim2.fromScale(0.25, 0.1)

local UICorner = Instance.new("UICorner", InputFrame)
UICorner.CornerRadius = UDim.new(0, 6)

local UIGradient = Instance.new("UIGradient", InputFrame)
UIGradient.Name = "uIGradient2"
UIGradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 11, 19)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(38, 38, 38)),
})
UIGradient.Rotation = 90

local Stroke = Instance.new("Frame", InputFrame)
Stroke.AnchorPoint = Vector2.new(0.5, 0.5)
Stroke.BackgroundColor3 = Color3.fromRGB(0, 11, 19)
Stroke.BackgroundTransparency = 1
Stroke.Position = UDim2.fromScale(0.5, 0.5)
Stroke.Size = UDim2.fromScale(0.99, 0.95)

local UIStroke = Instance.new("UIStroke", Stroke)
UIStroke.Color = Color3.fromRGB(53, 53, 53)

local UICorner = Instance.new("UICorner", Stroke)
UICorner.CornerRadius = UDim.new(0, 6)

local Question = Instance.new("TextLabel", InputFrame)
Question.Font = Enum.Font.SourceSans
Question.Text = "What repository would you like to download?"
Question.TextColor3 = Color3.fromRGB(255, 255, 255)
Question.TextSize = 20
Question.TextXAlignment = Enum.TextXAlignment.Left
Question.TextYAlignment = Enum.TextYAlignment.Bottom
Question.AnchorPoint = Vector2.new(0.5, 0.5)
Question.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Question.BackgroundTransparency = 1
Question.Position = UDim2.fromScale(0.3, 0.2)
Question.Size = UDim2.fromScale(0.5, 0.2)
Question.TextScaled = true

local Accept = Instance.new("TextButton", InputFrame)
Accept.Font = Enum.Font.SourceSans
Accept.Text = "Accept"
Accept.TextColor3 = Color3.fromRGB(255, 255, 255)
Accept.TextSize = 14
Accept.AnchorPoint = Vector2.new(0.5, 0.5)
Accept.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
Accept.BorderSizePixel = 0
Accept.Position = UDim2.fromScale(0.15, 0.8)
Accept.Size = UDim2.fromScale(0.2, 0.2)

local UICorner = Instance.new("UICorner", Accept)
UICorner.CornerRadius = UDim.new(0, 4)

local UIStroke = Instance.new("UIStroke", Accept)
UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke.Color = Color3.fromRGB(53, 53, 53)

local Cancel = Instance.new("TextButton", InputFrame)
Cancel.Font = Enum.Font.SourceSans
Cancel.Text = "Cancel"
Cancel.TextColor3 = Color3.fromRGB(255, 255, 255)
Cancel.TextSize = 14
Cancel.AnchorPoint = Vector2.new(0.5, 0.5)
Cancel.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
Cancel.BorderSizePixel = 0
Cancel.Position = UDim2.fromScale(0.375, 0.8)
Cancel.Size = UDim2.fromScale(0.2, 0.2)

local UICorner = Instance.new("UICorner", Cancel)
UICorner.CornerRadius = UDim.new(0, 4)

local UIStroke = Instance.new("UIStroke", Cancel)
UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke.Color = Color3.fromRGB(53, 53, 53)

local RepositoryBox = Instance.new("TextBox", InputFrame)
RepositoryBox.Font = Enum.Font.SourceSans
RepositoryBox.PlaceholderColor3 = Color3.fromRGB(204, 204, 204)
RepositoryBox.PlaceholderText = "Enter Repository."
RepositoryBox.Text = ""
RepositoryBox.TextColor3 = Color3.fromRGB(255, 255, 255)
RepositoryBox.TextSize = 14
RepositoryBox.AnchorPoint = Vector2.new(0.5, 0.5)
RepositoryBox.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
RepositoryBox.BorderColor3 = Color3.fromRGB(27, 42, 53)
RepositoryBox.Position = UDim2.fromScale(0.5, 0.5)
RepositoryBox.Size = UDim2.fromScale(0.9, 0.25)

local UIStroke = Instance.new("UIStroke", RepositoryBox)
UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke.Color = Color3.fromRGB(53, 53, 53)

local UICorner = Instance.new("UICorner", RepositoryBox)
UICorner.CornerRadius = UDim.new(0, 4)

local Headers = {
    ["Authorization"] = "TOKEN " .. AuthToken,
}

local rand = math.random
local max = math.max
local min = math.min
local floor = math.floor

local function bytes(n)
    local s = tostring(math.floor(n))
    local s = string.sub(s, 1, ((#s - 1) % 3 ) + 1) .. ({" bytes", "Kb", "Mb", "GB", "TB"})[math.floor((#s - 1) / 3) + 1]
    if n == 1 then s = s:sub(1, #s-1) end
    return s
end

local function hms(s)
    s = min(floor(s), 86400)
    return string.format("%02i", ((s - s%60)/60 - (s - s%60)/60%60)/60)..":"..string.format("%02i", (s - s%60)/60 - ((s - s%60)/60 - (s - s%60)/60%60)/60*60)..":"..string.format("%02i", s - (s - s%60)/60*60)
end

local Files = {}
local TotalBytes = 0
local function FetchDirectory(Path, Directory)
    local Directory = game.HttpService:JSONDecode(syn.request({
        Url = Directory,
        Headers = Headers
    }).Body)

    table.sort(Directory, function(a, b)
        return a.type < b.type
    end)

    for _,File in next, Directory do
        if File.type == "file" then
            table.insert(Files, {Path .. "/" .. File.name, File.download_url, File.size})
            TotalBytes = TotalBytes + File.size
        elseif File.type == "dir" then
            makefolder(Path .. "/" .. File.name)
            FetchDirectory(Path .. "/" .. File.name, File.url)
        end
    end

    return Files
end

Accept.Activated:Connect(function()
    local Repository = RepositoryBox.Text
    if Repository == "" then return end

    DownloadFrame.Visible = true
    InputFrame.Visible = false

    makefolder(Repository)
    local Repository = FetchDirectory(Repository, string.format("https://api.github.com/repos/%s/contents", Repository))
    local Downloaded = 0
    local x = {}
    
    for i = 1,2 do x[#x+1] = {0, 0, os.clock()} end
    
    for i,v in pairs(Repository) do
        writefile(v[1], game:HttpGet(v[2]))
        Downloaded = Downloaded + v[3]

        local Percentage = math.floor((Downloaded / TotalBytes) * 100)

        while os.clock() - x[1][3] > 1 and #v > 3 do table.remove(x, 1) end
        x[#x+1] = {Downloaded - x[#x-1][2] or 0, Downloaded, os.clock()}
        PerSecond = 0 for i,v in next, x do PerSecond = PerSecond + v[1] end
        local Estimate = hms((TotalBytes - Downloaded) / PerSecond + 0.9999)

        local FilePath = v[1]

        PercentageStatus.Text = string.format("%s%% (%s / %s) eta %s", Percentage, bytes(Downloaded), bytes(TotalBytes), Estimate)
        FileStatus.Text = string.format("Downloading %s (%s)", FilePath, bytes(v[3]))
    end

    DownloadFrame.Visible = false
end)
