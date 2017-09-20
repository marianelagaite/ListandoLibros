class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user

  scope :get_review, -> (book_id, user_id) { where('book_id = ? AND user_id = ?', book_id, user_id) }
end
