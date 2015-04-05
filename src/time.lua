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
    local amount = math.floor(msec_out / unit[i])
    str_out = str_out .. amount

    if i == 3 then str_out = str_out .. ':'
    else str_out = str_out .. ','
    end

    remainder = remainder % unit[i]
  end

  return str_out .. remainder   
end
