class Author < ApplicationRecord
	has_and_belongs_to_many :books
	validates :nombre, presence: true
	validates_length_of :nombre, :maximum => 100, :message => "El nombre debe tener menos de 100 caracteres"
end
