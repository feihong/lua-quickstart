print("你好世界！")

message = '再见宇宙。'

-- Lua strings aren't unicode
for uchar in string.gmatch(message, "([%z\1-\127\194-\244][\128-\191]*)") do
  print(uchar)
end
