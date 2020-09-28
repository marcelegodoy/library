def nif_valid?(nif)
  null_nifs = %w{123456789 111111111 222222222 333333333 444444444 555555555 666666666 777777777 888888888 999999999 000000000 012345678}

  return false if null_nifs.include?(nif)
  return false unless nif.length == 9

  nif_array = nif.scan /[0-9]/
  last_digit = nif.last
  nif_array.pop
  i = 0
  check = 0
  nif_array.each do |n|
    check += n.to_i * (9 - i)
    i += 1
  end
  checkDigit = (11 - (check % 11)) > 9 ? 0 : 11 -(check % 11)
  return true if last_digit.to_i == checkDigit.to_i
  return false unless last_digit.to_i == checkDigit.to_i
end
