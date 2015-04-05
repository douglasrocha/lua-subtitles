function timestamp_to_miliseconds(timestamp)
  local values = string.gmatch(timestamp, '%d+')

  print(#values)

  local timestamp_msec = values[1] * 60 *60 *1000
                       + values[2] * 60 * 1000
                       + values[3] * 1000
                       + values[4]
  
  return timestamp_msec
end

print(timestamp_to_miliseconds("1:15:32,234"))
