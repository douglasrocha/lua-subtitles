require 'regex'
require 'file'

-- Creates regex patterns to determine which are the
-- range sentence of srt segments
TIMESTAMP_PATTERN = '%d+:%d+:%d+,%d+'
REGEX_PATTERN = TIMESTAMP_PATTERN .. ' [-][-][>] ' .. TIMESTAMP_PATTERN

function is_line_time_range(line)
  return is_match(line, REGEX_PATTERN)
end

function add_time(timestamp, miliseconds)
  local values = {}

  for value in timestamp:gmatch('%d+') do
    values[#values + 1] = tonumber(value)
  end

  local timestamp_msec = values[1] * 60 * 60 * 1000
                       + values[2] * 60 *1000
                       + values[3] * 1000 
                       + values[4]

  local msec_out = timestamp_msec + miliseconds 
  local unit = {3600000, 60000, 1000, 1}
  local str_out = ''

  for i=1,3 do
    local amount = math.floor(msec_out / unit[i])
    str_out = str_out .. amount
    
    if i == 3 then str_out = str_out .. ':'
    else str_out = str_out .. ','
    end

    msec_out = msec_out % unit[i] 
  end

  return str_out .. msec_out
end


print(add_time("1:12:52,312", 1500))
