class StringCalculator
   def add(string_numbers)
     if string_numbers.empty?
       0
     else
       numbers = string_numbers.split(%r{[,/n]})
       calculate(numbers)
     end
   end

   def calculate(numbers)
     total = numbers.collect { |x| x.to_i }
     total.reduce(:+)
   end
end