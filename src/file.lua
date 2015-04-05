-- Copyright 2015 Douglas Bellon Rocha
-- 
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
-- 
--     http://www.apache.org/licenses/LICENSE-2.0
-- 
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.

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

-- write new file with lines passed by parameter
function write_file(file, lines)
  local f = io.open(file, "w")
  for i = 1, #lines do
    f:write(lines[i])
  end
  f:close()
end
