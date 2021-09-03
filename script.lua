package.path = package.path .. ';.luarocks/share/lua/5.2/?.lua'.. ';.luarocks/share/lua/5.2/?/init.lua'
package.cpath = package.cpath .. ';.luarocks/lib/lua/5.2/?.so'
redis = dofile("./libs/redis.lua").connect("127.0.0.1", 6379)
serpent = dofile("./libs/serpent.lua")  
JSON  = dofile("./libs/dkjson.lua")
json = dofile("./libs/JSON.lua")
http = require("socket.http")
URL = dofile("./libs/url.lua")
https = require("ssl.https")
tdcli = require("tdcli")
function vardump(value)  
print(serpent.block(value, {comment=false}))   
end 
function dl_cb(arg, data)
vardump(arg)
vardump(data)
end
function tdcli_update_callback(data)
if (data.ID == "UpdateNewMessage") then
local msg = data.message_
if msg.content_.ID == "MessageText" then
if msg.content_.text_ == "ping" then
tdcli.sendText(msg.chat_id_, msg.id_, 0, 1, nil, 'pong', 1)
elseif msg.content_.text_ == "PING" then
tdcli.sendText(msg.chat_id_, 0, 0, 1, nil, '<b>PONG</b>', 1, 'html')
end
end
elseif (data.ID == "UpdateOption" and data.name_ == "my_id") then
tdcli_function ({
ID="GetChats",
offset_order_="9223372036854775807",
offset_chat_id_=0,
limit_=20
}, dl_cb, nil)
end
end