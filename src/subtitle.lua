require 'regex'
require 'file'
require 'time'

-- Creates regex patterns to determine which are the
-- range sentence of srt segments
TIMESTAMP_PATTERN = '%d+:%d+:%d+,%d+'
REGEX_PATTERN = TIMESTAMP_PATTERN .. ' [-][-][>] ' .. TIMESTAMP_PATTERN

function is_line_time_range(line)
  return is_match(line, REGEX_PATTERN)
end

function add_miliseconds_to_file(file, ms, file_out, from, to)
  local is_from_nil = from == nil
  local is_to_nil = to == nil

  local file_lines = get_all_lines(file) 
  local new_lines = {} 

  for index, line in pairs(file_lines) do
    if is_line_time_range(line)
      and((is_from_nil or (not is_from_nil and compare_timestamps(line, from) <= 1))
      and (is_to_nil or (not is_to_nil and compare_timestamps(to, line) <= 1)))
    then
      local temp = {}
    
      for ts in line:gmatch(TIMESTAMP_PATTERN) do
        temp[#temp + 1] = ts
      end

      for i,ts in pairs(temp) do temp[i] = add_time(ts, ms) end
  
      new_lines[#new_lines + 1] = temp[1] .. " --> " .. temp[2] .. '\n'
    else
      new_lines[#new_lines + 1] = line .. '\n'
    end
  end

  write_file(file_out, new_lines)
end
