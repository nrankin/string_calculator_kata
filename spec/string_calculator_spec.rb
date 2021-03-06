require 'rspec'
require 'string_calculator'

describe StringCalculator do
  context 'adds numbers passed to it in a string' do
    context 'when there is only one number in the string' do
     it 'should return 0 for empty string' do
       expect(subject.add('') == 0).to be_true
     end
     it 'should return 1 for "1"' do
       expect(subject.add('1') == 1).to be_true
     end
    end
    context 'when there are two numbers in the string' do
      it 'should return 2 for "1,1"' do
         expect(subject.add('1,1') == 2).to be_true
      end
      it 'should return 3 for "1,2"' do
        expect(subject.add('1,2') == 3).to be_true
      end
    end
    context 'when there are three numbers in the string' do
      it 'should return 8 for "3,1,4"' do
        expect(subject.add('3,1,4') == 8).to be_true
      end
      it 'should return 21 for "5,1,3,2,7,1,2"' do
        expect(subject.add('5,1,3,2,7,1,2') == 21).to be_true
      end

    end
    context 'still works when the delimeter is /n' do
      it 'should return 21 for "5\n1\n3\n2\n7\n1\n2"' do
        expect(subject.add('5\n1\n3\n2\n7\n1\n2') == 21).to be_true
      end
      it 'should return 8 for "3\n1,4"' do
        expect(subject.add('3\n1,4') == 8).to be_true
      end
    end
    context 'a delimiter can be passed in on the first line' do
      it 'should find the second line doesn"t start with \n' do
        numbers = subject.split('//:\n3:1:4')

        expect(numbers[0] == '3').to be_true
        expect(numbers[0] == '\n').to be_false
      end
      it 'should return 8 for "//:\n3:1:4"' do
        expect(subject.add('//:\n3:1:4') == 8).to be_true
      end
      it 'should return 8 for "//;\n3;1;4"' do
        expect(subject.add('//;\n3;1;4') == 8).to be_true
      end
    end
    context 'an exception should be thrown if negatives are passed in' do
      it 'should throw an exception if -1 is passed in' do
        expect{subject.add('-1')}.to raise_error(ArgumentError)
      end
      it 'should have the message "Negatives Not Allowed"' do
        expect{subject.add('-1')}.to raise_error(ArgumentError, "Negatives Not Allowed: [-1]")
      end
      it 'should include all supplied negative numbers in the error message' do
        expect{subject.add('-1,-4,-2')}.to raise_error(ArgumentError, "Negatives Not Allowed: [-1, -4, -2]")
      end
    end

  end


end