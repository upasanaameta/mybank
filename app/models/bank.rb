class Bank < ApplicationRecord
	  validates :name, presence: true, length:{maximum: 30}

	  has_many :branches
	  
end