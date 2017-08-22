local f = io.open("manual.md", "rb")
local data = f:read("*all")
f:close()

local offset = 0

local function trim(s)
  return (s:gsub("^%s*(.-)%s*$", "%1"))
end

local function split(str, pat)
    local t = {}
    if str then
        local fpat = "(.-)" .. pat
        local last_end = 1
        local s, e, cap = str:find(fpat, 1)
        while s do
            if s ~= 1 or cap ~= "" then
                table.insert(t, cap)
            end
            last_end = e + 1
            s, e, cap = str:find(fpat, last_end)
        end
        if last_end <= #str then
            cap = str:sub(last_end)
            table.insert(t, cap)
        end
    end
    return t
end

while true do
    local st,ed = string.find(data, "<!-- [FILE]", offset, true)
    if st and ed then
        offset = ed

        local st2,ed2 = string.find(data, "-->", offset, true)
        local filepath = trim(string.sub(data, ed + 1, st2 - 1))
        local parts = split(filepath, "/")
        local dir = table.concat(parts, "/", 1, #parts - 1)
        os.execute("mkdir -p " .. dir)

        local st3,_ = string.find(data, "```", ed2, true)
        local st4,ed4 = string.find(data, "\n", st3, true)

        local st5,ed5 = string.find(data, "```", ed4, true)

        local body = trim(string.sub(data, ed4 + 1, st5 - 1))

        local f = io.open(filepath, "wb")
        f:write(body)
        f:close()
    else
        break
    end
end