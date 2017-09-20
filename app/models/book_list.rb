class BookList < ApplicationRecord
  belongs_to :user
  has_many :listed_books, class_name:'ListedBook', dependent: :destroy
  has_many :books, :through => :listed_books
  validates :nombre, presence: true
  validates_length_of :nombre, :maximum => 50, :message => "El nombre debe tener menos de 50 caracteres"
  validates :user, presence: true
end
