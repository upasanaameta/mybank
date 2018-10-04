class Accounts < ApplicationRecord
	  validates :number, presence: true, numericality:{only_integer: true}, length:{maximum:20}
	  validates :acc_type, presence: true, length:{maximum: 30}
	  validates :balance, presence: true

	  has_many :transactions
end

