def funding_status(name, amount=1000)
  "Project #{name} has $#{amount} in funding."
end

puts funding_status('ABC')
puts funding_status('LMN')
puts  funding_status('XYZ')