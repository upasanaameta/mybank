require 'rails_helper'
RSpec.describe Post, :type => :model do
  context "Loan validation" do
    end

    it 'is a valid factory' do
      loan = FactoryBot.build(:loan)
      expect(loan).to be_valid
    end

    it 'has a loan_type' do
       expect(FactoryBot.build(:loan, loan_type: nil)).to be_invalid
      end

    it 'does not allow blank loan_type' do
         expect(FactoryBot.build(:loan, loan_type: '')).to be_invalid
        end 

    it 'has valid loan_type' do
         expect(FactoryBot.build(:loan, loan_type: 'Personal')).to be_valid
        end

    it 'has valid loan_type' do
         expect(FactoryBot.build(:loan, loan_type: 'Home')).to be_valid
        end

    it 'has valid loan_type' do
         expect(FactoryBot.build(:loan, loan_type: 'Business')).to be_valid
        end

    it 'has valid loan_type' do
         expect(FactoryBot.build(:loan, loan_type: 'Education')).to be_valid
        end

    it 'has valid loan_type' do
         expect(FactoryBot.build(:loan, loan_type: 'Gold')).to be_valid
        end

    it 'has valid loan_type' do
         expect(FactoryBot.build(:loan, loan_type: 'Vehicle')).to be_valid
        end

    it 'can not have number as loan_type' do
         expect(FactoryBot.build(:loan, loan_type: '1234')).to be_invalid
        end

    it 'can not have float as loan_type' do
         expect(FactoryBot.build(:loan, loan_type: '12.34')).to be_invalid
        end

    it 'should have loan_amount' do
       expect(FactoryBot.build(:loan, amount: nil)).to be_invalid
      end

    it 'does not allow blank amount' do
         expect(FactoryBot.build(:loan, amount: '')).to be_invalid
    end

    it 'allow loan_amount more than 50000' do
       expect(FactoryBot.build(:loan, amount: '54320')).to be_valid
      end

    it 'does not allow loan_amount less than 50000' do
       expect(FactoryBot.build(:loan, amount: '5000')).to be_invalid
      end

    it 'allow loan_amount in integer' do
       expect(FactoryBot.build(:loan, amount: '5400')).to be_valid
      end

    it 'allow loan_amount in float' do
       expect(FactoryBot.build(:loan, amount: '54000.98')).to be_valid
      end

    it 'is invalid take string for loan_amount' do
         expect(FactoryBot.build(:loan, amount: 'asdf12')).to be_invalid
        end

end