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

function add_time(timestamp, miliseconds)
  local timestamp_msec = timestamp_to_miliseconds(timestamp)
  timestamp_msec = timestamp_msec + miliseconds 
  return miliseconds_to_timestamp(timestamp_msec)
end

function compare_timestamps(timestamp1, timestamp2)
  local t1msec = timestamp_to_miliseconds(timestamp1)
  local t2msec = timestamp_to_miliseconds(timestamp2)

  if t1msec > t2msec then return 1
  elseif t2msec > t1msec then return 2
  end

  return 0
end

function add_miliseconds_to_file(file, timestamp, ms, from, to)
  -- optional parameters
  from = from or -math.inf
  to = to or math.inf

  
end












