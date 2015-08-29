local userconf = "oh3ctest"
local userinfo = {}
local uci = luci.model.uci.cursor()
local oh3c = uci:get_all(userconf)
local devices = {}
for _,v in luci.util.vspairs(luci.sys.net.devices()) do
    if v:match("^eth%d") or v:match("^ath%d") or v:match("^wl%d") or v:match("^wlan%d")then
        devices[#devices+1] = v
    end
end

m = Map(userconf, "OH3C")

s = m:section(TypedSection, "userinfo", "User Information")
s.addremove = true
s.anonymous = true
s.template = "cbi/tblsection"

user = s:option(Value, "username", "Username")

key = s:option(Value, "password", "Password")
key.password = true

mac = s:option(Value, "macaddr", "MAC Address")
mac.default = "default"

s = m:section(TypedSection, "control", translate("Control"))
s.anonymous = true
cur = s:option(ListValue, "current", "Current User")

for k,v in pairs(oh3c) do
    local i = uci:get(userconf .. "." .. k .. ".username")
    if i ~= nil then
        cur:value(i)
    end
end

dev = s:option(ListValue, "ifname", "Interface")
dev.default = "eth1"
for _, v in ipairs(devices) do
    dev:value(v)
end

function m.on_save(self)
    uci:commit(userconf)
end

function m.on_commit(self)
    uci:commit(userconf)
    current = uci:get(userconf .. ".@control[0].current")
    userinfo[0] = current
    for k,v in pairs(oh3c) do
        if uci:get(userconf .. "." .. k .. ".username") == current then
            userinfo[#userinfo+1] = uci:get(userconf .. "." .. k .. ".password")
            userinfo[#userinfo+1] = uci:get(userconf .. ".@control[0].ifname")
            userinfo[#userinfo+1] = uci:get(userconf .. "." .. k .. ".macaddr")
            break
        end
    end
    file = io.open("/tmp/log/oh3c", "w")
    io.close(file)
    luci.sys.call("python /usr/oh3c/oh3c.py " .. userinfo[0] .. " " .. userinfo[1] .. " " .. userinfo[2] .. " " .. userinfo[3] .. " > /tmp/log/oh3c")
end

return m
