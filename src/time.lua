function timestamp_to_miliseconds(timestamp)
  local values = {}

  for value in timestamp:gmatch('%d+') do
    values[#values + 1] = tonumber(value)
  end

  local timestamp_msec = values[1] * 60 * 60 *1000
                       + values[2] * 60 * 1000
                       + values[3] * 1000
                       + values[4]
  
  return timestamp_msec
end

function miliseconds_to_timestamp(miliseconds)
  local unit = {3600000, 60000, 1000, 1}
  local str_out = ''
  local remainder = miliseconds

  for i=1,3 do
    local amount = math.floor(remainder / unit[i])
    local amount_str = ''

    if amount < 10 then amount_str = '0' .. amount
    else amount_str = amount
    end

    str_out = str_out .. amount_str

    if i == 3 then str_out = str_out .. ','
    else str_out = str_out .. ':'
    end

    remainder = remainder % unit[i]
  end

  if remainder < 10 then return str_out .. '00' .. remainder
  elseif remainder < 100 then return str_out .. '0' .. remainder
  end

  return str_out .. remainder   
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
