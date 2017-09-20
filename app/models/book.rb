class Book < ApplicationRecord
	has_attached_file :image, styles: {medium: '200x300', small: '150x250'}, default_url: "/images/default-book-cover.png"
	
	has_and_belongs_to_many :authors
	has_and_belongs_to_many :genres
	has_many :listed_books, class_name:'ListedBook', dependent: :destroy
	has_many :book_lists, :through => :listed_books
	has_many :reviews, dependent: :destroy

	validates :titulo, presence: true
	validates :image, presence: true
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
	
	scope :ultimos_agregados, -> { (order(created_at: :desc)).limit(10) }

	 def self.search(term)
	   where("titulo like :term", term: "%#{term}%")
	 end
end
