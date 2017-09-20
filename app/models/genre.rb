class Genre < ApplicationRecord
	has_and_belongs_to_many :books
	validates :nombre, presence: true
	validates_length_of :nombre, :maximum => 50, :message => "El nombre debe tener menos de 50 caracteres"
end
