require 'rails_helper'
RSpec.describe Post, :type => :model do
  context "Bank validation" do

  	it 'is a valid factory' do
      bank = FactoryBot.build(:bank)
      expect(bank).to be_valid
	  end

	it 'should have a bank_name' do
  		 expect(FactoryBot.build(:bank, name: nil)).to be_invalid
  		end

  	it 'do not have blank bank_name' do
  		 expect(FactoryBot.build(:bank, name: '')).to be_invalid
  		end

  	it 'allow string bank_name' do
  		 expect(FactoryBot.build(:bank, name: 'abcdefg')).to be_valid
  		end

  	it 'allow string bank_name' do
  		 expect(FactoryBot.build(:bank, name: 'abcd efgh')).to be_valid
  		end


  	it 'must have string bank_name' do
  		 expect(FactoryBot.build(:bank, name: '1343')).to be_invalid
  		end

end

