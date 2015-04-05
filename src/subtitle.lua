require 'regex'
require 'file'

-- Creates regex patterns to determine which are the
-- range sentence of srt segments
TIMESTAMP_PATTERN = '%d+:%d+:%d+,%d+'
REGEX_PATTERN = TIMESTAMP_PATTERN .. ' [-][-][>] ' .. TIMESTAMP_PATTERN

function is_line_time_range(line)
  return is_match(line, REGEX_PATTERN)
end

function timestamp_to_milisecond(timestamp)
  local values = {}

  for value in timestamp:gmatch('%d+') do
    values[#values + 1] = tonumber(value)
  end

  local timestamp_msec = values[1] * 60 * 60 * 1000
                       + values[2] * 60 *1000
                       + values[3] * 1000 
                       + values[4]

  return timestamp_msec
end

function add_time(timestamp, miliseconds)
  local timestamp_msec = timestamp_to_milisecond(timestamp)
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

function compare_timestamp(timestamp1, timestamp2)
  local t1msec = timestamp_to_milisecond(timestamp1)
  local t2msec = timestamp_to_milisecond(timestamp2)

  if t1msec > t2msec then return 1
  else if t2msec > t1msec then return 2
  
  return 0
end






