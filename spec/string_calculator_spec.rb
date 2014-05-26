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
      it 'should return 21 for "5/n1/n3/n2/n7/n1/n2"' do
        expect(subject.add('5/n1/n3/n2/n7/n1/n2') == 21).to be_true
      end
      it 'should return 8 for "3/n1,4"' do
        expect(subject.add('3/n1,4') == 8).to be_true
      end
    end

  end


end