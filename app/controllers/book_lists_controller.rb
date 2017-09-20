class BookListsController < ApplicationController
  	before_action :set_lists, only: [:index]
  	before_action :set_list, only: [:update, :destroy]
  	before_action :authenticate_user!

	def index

	end
	def create
		@user = User.find(params[:user_id])
		@book_list = @user.book_lists.build(book_list_params)

		respond_to do |format|
		  if @book_list.save
		    format.html { redirect_to user_book_lists_path(user_id: current_user.id), notice: 'La lista se agregó correctamente.' }
		    format.json { render :show, status: :created, location: @book_list }
		    format.js
		  else
		    format.html { render :new }
		    format.json { render json: @list.errors, status: :unprocessable_entity }
		    format.js
		  end
		end
	end
	
	def update
	    respond_to do |format|
	      if @book_list.update(book_list_params)
	        format.html { redirect_to user_book_lists_path(user_id: current_user.id), {notice: 'La lista '+ @book_list.nombre+' se editó correctamente.', notice_action: "success"} }
	        format.json { render :show, status: :ok, location: @book_list }
	        format.js
	      else
	        format.html { render :edit }
	        format.json { render json: @book_list.errors, status: :unprocessable_entity }
	        format.js
	      end
	    end
	end

	def destroy
		@book_list.destroy
	    respond_to do |format|
	      format.html { redirect_to user_book_lists_path(user_id: current_user.id), notice: 'La lista '+ @book_list.nombre+' se eliminó correctamente.', notice_action: "success" }
	      format.json { head :no_content }
	    end
	end
	
private
	def set_list
	  @book_list = current_user.book_lists.find(params[:id])
	end

    def set_lists
      @book_lists = BookList.where(user_id: params[:user_id]).includes(:books)
    end

    def book_list_params
      params.require(:book_list).permit(:id,:nombre,:user_id, book_ids: [])
    end
end
