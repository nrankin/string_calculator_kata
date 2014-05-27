class StringCalculator

  DELIMITER_INDICATOR = '//'

   def add(string_argument)
     if string_argument.empty?
       0
     else
       string_numbers = split(string_argument)
       calculate(string_numbers)
     end
   end

   def split(string_argument)
     if string_argument.start_with?('//')
       split_by_custom_delimiters(string_argument)
     else
       split_by_default_delimiters(string_argument)
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
     lines[0].slice(DELIMITER_INDICATOR.length,(lines[0].length) -1)
   end

   def calculate(string_numbers)
     numbers = string_numbers.collect { |x| x.to_i }
     check_negatives(numbers)
     numbers.reduce(:+)
   end

   def check_negatives(numbers)
     negatives = Array.new(numbers)
     negatives.keep_if {|x| x < 0 }

     unless negatives.empty?
       raise(ArgumentError, "Negatives Not Allowed: " + negatives.to_s)
     end

   end

end