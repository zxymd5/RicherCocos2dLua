
cc.FileUtils:getInstance():setPopupNotify(false)
cc.FileUtils:getInstance():addSearchPath("src/")
cc.FileUtils:getInstance():addSearchPath("res/")
cc.FileUtils:getInstance():addSearchPath("frameworks/")
local breakSocketHandle,debugXpCall = require("LuaDebugjit")("localhost",7003)
cc.Director:getInstance():getScheduler():scheduleScriptFunc(breakSocketHandle, 0.3, false)

require "config"
require "cocos.init"

local function main()
    require("app.MyApp"):create():run()
end

function __G__TRACKBACK__(errorMessage)  
    debugXpCall();  
end

local status, msg = xpcall(main, __G__TRACKBACK__)
if not status then
    print(msg)
end
