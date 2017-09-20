class BooksController < ApplicationController
  before_action :set_book, only: [:show]

  # GET /books
  # GET /books.json
  def index
    if params[:search].blank?
      @books = Book.all.paginate(:page => params[:page], :per_page => 30)
      @title = "Libros"
    else
      @books = Book.search(params[:search]).paginate(:page => params[:page], :per_page => 30)
      if @books.any?
        @title = "Libro/s encontrados"
      else
        @title = "No se encontró ningún libro"
      end
    end
  end

  # GET /books/1
  # GET /books/1.json
  def show
    if user_signed_in?
      @user_review = Review.get_review(@book.id, current_user.id)
      @user_lists = BookList.where(user_id: current_user.id).order("nombre")
      @selected_list = BookList.joins(:books).group('book_lists.id').where(user_id: current_user.id).where(books: {id: @book.id}).first
    end
    @reviews = @book.reviews.includes(:user).paginate(:page => params[:page], :per_page => 5)
    if @book.reviews.blank?
      @average_review = 0
    else
      @average_review = @book.reviews.average(:rating).round(2)
    end    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:titulo, :fecha_publicacion, :descripcion, :image, author_ids: [], genre_ids: [], book_list_ids: [])
    end
end
