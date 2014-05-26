class StringCalculator
   def add(string_numbers)

     numbers = string_numbers.split(%r{[,/n]})
     if numbers.compact.length == 0
       return 0
     end
     total = numbers.collect{|x| x.to_i}
     total.reduce(:+)

   end
end