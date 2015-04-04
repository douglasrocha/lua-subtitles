require 'regex'
require 'file'

-- Creates regex pattern to determine which are the
-- range sentence of srt segments
--REGEX_PATTERN = '%d+:%d+:%d+,%d+ --> %d+:%d+:%d+,%d+'
REGEX_PATTERN = '%d+:%d+:%d+,%d+ [-][-][>] %d+:%d+:%d+,%d+'

function is_line_time_range(line)
  return is_match(line, REGEX_PATTERN)
end
