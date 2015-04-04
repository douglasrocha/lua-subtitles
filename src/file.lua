-- see if the file exists
function file_exists(file)
  local f = io.open(file, "r");
  if f then f:close() end
  return f ~= nil
end

-- set all lines from a file, returns an empty
-- list/table if the file does not exist
function get_all_lines(file)
  if not file_exists(file) then return {} end
  lines = {}
  for line in io.lines(file) do
    lines[#lines + 1] = line
  end
  return lines
end

-- print all line numbers and their contents
function print_lines(lines) 
  for k,v in pairs(lines) do
    print('lines[' .. k .. ']', v)
  end
end

function write_file(file, lines)
  local f = io.open(file, "w")
  for i = 1, #lines do
    f:write(lines[i])
  end
  f:close()
end

-- print_lines(get_all_lines('/home/douglas/teste.txt'))

write_file('/home/douglas/output.txt', {"Linha 1\n", "Linha 2\n"})
