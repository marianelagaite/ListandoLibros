class Book < ApplicationRecord
	has_and_belongs_to_many :authors
	has_and_belongs_to_many :categories

	validates :titulo, presence: true
end