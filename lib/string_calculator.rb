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

   def split_by_default_delimiters(string_argument)
     string_argument.split(%r{[,\\n]})
   end

   def split_by_custom_delimiters(string_argument)
     lines = string_argument.split(%r{\\n}, 2)
     lines[1].split(delimiter(lines))
   end

   def delimiter(lines)
     lines[0].slice(DELIMITER_INDICATOR.length,(lines[0].length) -1)
   end

   def calculate(string_numbers)
     negatives = Array.new
     numbers = string_numbers.map do |x|
       x = x.to_i
       if x < 0
         negatives << x
       end
       x
     end
     check_negatives(negatives)
     numbers.reduce(:+)
   end

   def check_negatives(negatives)
     unless negatives.empty?
       raise(ArgumentError, "Negatives Not Allowed: " + negatives.to_s)
     end
   end

end