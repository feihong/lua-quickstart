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

eyes = getChars("^ᵒ♥•ಠ°ಥ・$'")
mouths = getChars('_◡ᴥ□Д益ェω∀')
sides_ = getChars('()[]{}《》【】||')
sides = {}
for i=1,#sides_/2 do
  sides[i] = {sides_[i*2 - 1], sides_[i*2]}
end

-- print(#eyes)
for _, c in ipairs(eyes) do
  print(c)
end
