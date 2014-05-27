class StringCalculator
   def add(string_numbers)
     if string_numbers.empty?
       0
     else
       numbers = split(string_numbers)
       calculate(numbers)
     end
   end

   def split(string_numbers)
     if string_numbers.start_with?('//')
       lines = string_numbers.split(%r{\\n}, 2)
       delimiter = lines[0].slice(2,(lines[0].length) -1)
       numbers = lines[1].split(delimiter)
     else
       numbers = string_numbers.split(%r{[,\\n]})
     end

   end

   private

   def calculate(numbers)
     total = numbers.collect { |x| x.to_i }
     total.reduce(:+)
   end

end