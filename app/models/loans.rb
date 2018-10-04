class Loans < ApplicationRecord
	validates :loan_type, presence: true, length:{maximum: 30}
	validates :amount, presence: true, length:{maximum: 10}
end
