dofile("./libs/config.lua")
URL = require('socket.url')
https = require("ssl.https")
JSON    = dofile("./libs/dkjson.lua")
Server_Done = io.popen("echo $SSH_CLIENT | awk '{ print $1}'"):read('*a')
if Server_Done then 
if not token then 
print("\27[1;34m»» Send Your Token Bot :\27[m")
local token_Bot = io.read()
c = https.request("https://api.telegram.org/bot" ..URL.escape(token_Bot).. "/getMe")
local get = JSON.decode(c)
if get and get.ok == true then 
print("\27[1;34mSend Your Id Sudo :\27[m")
local Sudo_Bot = io.read() 
if Sudo_Bot then 
config = io.open("./libs/config.lua", 'w')
config:write("token = '" ..token_Bot.."'\n\nsudos = "..Sudo_Bot)
config:close()
os.execute('rm -fr ../.telegram-cli')
os.execute('./libs/tdbot -p cli --login --bot='..token_Bot)
else 
print('\n\27[1;31mThe Id was not Saved\n\27[0;39;49m')
os.exit()
end 
else 
print('\n\27[1;31mThe Token was not Saved\n\27[0;39;49m')
os.exit()
end 
else 
os.execute('rm -fr ../.telegram-cli')
os.execute('./libs/tdbot -p cli --login --bot='..token)
end
else 
print("\27[1;31mThis server is not supported\27[0;39;49m")
os.exit()
end 