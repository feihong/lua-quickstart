-- get an array of the unicode chars in the given string
function getChars(s)
  local result = {}
  local i = 0
  for uchar in string.gmatch(s, "([%z\1-\127\194-\244][\128-\191]*)") do
    i = i + 1
    result[i] = uchar
  end
  return result
end

function choice(array)
  return array[math.random(#array)]
end

eyes = getChars("^ᵒ♥•ಠ°ಥ・$'")
mouths = getChars('_◡ᴥ□Д益ェω∀')
sides_ = getChars('()[]{}《》【】||')
sides = {}
for i=1,#sides_/2 do
  sides[i] = {sides_[i*2 - 1], sides_[i*2]}
end

function generateEmoticon()
  local eye = choice(eyes)
  local mouth = choice(mouths)
  local left, right = table.unpack(choice(sides))
  return table.concat({left, eye, mouth, eye, right}, '')
end

print('Emoticon Generator\n')
n = tonumber(arg[1])
if n == nil then n = 8 end

for i=1,n do
  print(generateEmoticon())
end
