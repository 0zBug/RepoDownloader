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

local function bar(p)
    return "|" .. ("█"):rep(min(max(floor(p/5), 1), 20)) .. ("  "):rep(20 - min(max(floor(p/5), 1), 20)) .. "|"
end

local function hms(s)
    s = min(floor(s), 86400)
    return string.format("%02i", ((s - s%60)/60 - (s - s%60)/60%60)/60)..":"..string.format("%02i", (s - s%60)/60 - ((s - s%60)/60 - (s - s%60)/60%60)/60*60)..":"..string.format("%02i", s - (s - s%60)/60*60)
end

local function Github(Repository)
    local Body = game:HttpGet("https://github.com/" .. Repository)
    local a = {}
    local bits = 0
    
    local function b(c)
        local d, _ = pcall(function()game:HttpGet("https://raw.githubusercontent.com/" .. Repository .. "/main/" .. c)end)
        if not d then
            return false
        else
            return true
        end
    end
    local e = false
    while not e do
        local f, g = string.find(Body, '--primary" title="')
        if not f then
            e = true
        else
            local h = g
            while wait() do
                h = h + 1
                local i = Body:sub(h, h)
                if i == '"' then
                    break
                end
            end
            local j = Body:sub(g + 1, h - 1)
            if b(j) then
                table.insert(a, {j, game:HttpGet("https://raw.githubusercontent.com/" .. Repository .. "/main/" .. j)})
            end
            Body = Body:sub(h, #Body)
        end
    end
    for i,v in next, a do
        bits = bits + #v[2]
    end
    
    return a, bits
end

return function(Link)
    print("Fetching https://github.com/" .. Link .. "...")
    local Start = os.clock()
    local Repository, Bits = Github(Link)
    print("Downloading https://github.com/" .. Link .. ".")
    local Downloaded = 0
    local Percent = 0
    local PerSecond =  0
    local Estimate = 0
    local x = {}
    
    for i = 1,2 do x[#x+1] = {0, 0, os.clock()} end
    
    makefolder(string.split(Link, "/")[2])
    for i,v in next, Repository do
        Downloaded = Downloaded + #v[2]
        Percent = (Downloaded/Bits)*100
        while os.clock() - x[1][3] > 1 do table.remove(x, 1) end
        x[#x+1] = {Downloaded - x[#x-1][2] or 0, Downloaded, os.clock()}
        PerSecond = 0 for i,v in next, x do PerSecond = PerSecond + v[1] end
        Estimate = hms((Bits-Downloaded)/PerSecond+0.9999)
        FileName = "\n" .. (" "):rep(#tostring(math.floor(Percent)) + 4) .. v[1] .. " (" .. bytes(#v[2]) .. ")\n"
        
        writefile(string.split(Link, "/")[2] .. "/" .. v[1], v[2])
        print(FileName, math.floor(Percent) .. "%", bar(Percent), bytes(Downloaded), bytes(PerSecond) .. "/s", "eta", Estimate)
        wait()
    end
    
    print("Downloaded", bytes(Bits), "from https://github.com/" .. Link .. " in " .. hms(os.clock() - Start) .. ".")
end
