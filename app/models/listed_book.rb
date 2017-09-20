class ListedBook < ActiveRecord::Base
    belongs_to :book
    belongs_to :book_list
end