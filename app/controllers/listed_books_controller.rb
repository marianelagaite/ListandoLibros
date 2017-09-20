class ListedBooksController < ApplicationController
	before_action :authenticate_user!

	def index

	end

	def create
		@listed = ListedBook.new(listed_book_params)
		@associated = BookList.joins(:books).group('book_lists.id').where(books: {id: listed_book_params['book_id']}).first
		if(!@associated.nil?)
			@book = Book.find(listed_book_params['book_id'])	
			@associated.books.delete(@book)
		end
		@listed.save()
	end

private

    def listed_book_params
      params.require(:listed_book).permit(:book_list_id, :book_id)
    end
end