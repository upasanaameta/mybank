class Users < ApplicationRecord
	validates :name, presence: true, length:{maximum: 30}
	validates :address, presence:true, length:{maximum: 50}
    validates :number, presence: true, numericality:{only_integer: true}, length:{maximum:10}
    validates :age, presence: true, numericality:{only_integer: true}, length:{maximum:2}

    has_many :loans
    has_one :account
end
