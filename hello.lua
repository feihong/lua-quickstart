print("你好世界！")

message = '再见宇宙。'

print('Break the message down:')

-- Lua strings aren't unicode, see http://lua-users.org/wiki/LuaUnicode
for uchar in string.gmatch(message, "([%z\1-\127\194-\244][\128-\191]*)") do
  print(uchar)
end
