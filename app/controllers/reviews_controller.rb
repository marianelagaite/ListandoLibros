class ReviewsController < ApplicationController
  before_action :set_review, only: [:update, :destroy]
  before_action :authenticate_user!
  def new
    @book = Book.find(params[:book_id])
  end
  # POST /reviews
  # POST /reviews.json
  def create
    @book = Book.find(params[:book_id])
    @review = @book.reviews.build(review_params)
    @review.user = current_user

    respond_to do |format|
      if @review.save
        format.html { redirect_to book_path(@book), notice: 'Su crítica se envió correctamente.' }
        format.json { render :show, status: :created, location: @review }
        format.js
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end
  
  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:comment, :rating, :book_id, :user_id)
    end
end
