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
       split_by_custom_delimiters(string_numbers)
     else
       split_by_default_delimiters(string_numbers)
     end
   end

   private

   def split_by_default_delimiters(string_numbers)
     string_numbers.split(%r{[,\\n]})
   end

   def split_by_custom_delimiters(string_numbers)
     lines = string_numbers.split(%r{\\n}, 2)
     lines[1].split(delimiter(lines))
   end

   def delimiter(lines)
     lines[0].slice(2,(lines[0].length) -1)
   end

   def calculate(numbers)
     total = numbers.collect { |x| x.to_i }
     check_negatives(total)
     total.reduce(:+)
   end

   def check_negatives(total)
     negatives = Array.new(total)
     negatives.keep_if {|x| x < 0 }

     unless negatives.empty?
       raise(ArgumentError, "Negatives Not Allowed: " + negatives.to_s)
     end

   end

end