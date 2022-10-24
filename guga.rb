def number_in_number?(outer, inner)
  test = 10**(inner < 2 ? 1 : Math.log10(inner).ceil.to_i)
  while outer >= inner
    return true if ((outer - inner) % test).zero?

    outer /= 10
  end
  false
end

p number_in_number?(15_342_671_232_150, 2)
