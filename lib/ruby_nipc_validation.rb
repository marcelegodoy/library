def nipc_valid?(nipc)
  null_nipcs = %w{123456789 111111111 222222222 333333333 444444444 555555555 666666666 777777777 888888888 999999999 000000000 012345678}

  return false if null_nipcs.include?(nipc)
  return false unless nipc.length == 9

  nipc_array = nipc.scan /[0-9]/
  last_digit = nipc.last
  nipc_array.pop
  i = 0
  check = 0
  nipc_array.each do |n|
    check += n.to_i * (9 - i)
    i += 1
  end
  checkDigit = (11 - (check % 11)) > 9 ? 0 : 11 -(check % 11)
  return true if last_digit.to_i == checkDigit.to_i
  return false unless last_digit.to_i == checkDigit.to_i
end
