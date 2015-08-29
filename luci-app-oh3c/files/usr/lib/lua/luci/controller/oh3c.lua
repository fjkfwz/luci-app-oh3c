module("luci.controller.oh3c", package.seeall)

function index()
    entry({"admin", "network", "oh3c"}, cbi("oh3c/usermgr"), "OH3C", 30).dependent=false

end
