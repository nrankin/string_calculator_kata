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
    end
  end


end