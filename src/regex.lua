-- checks whether input string matches the specified
-- regex pattern
function is_match(input, regex)
  if string.match(input, regex) == nil then
    return false
  end
  return true
end
