class LibrariesController < ApplicationController

  def index
    @books = current_user.myLibrary.paginate page: params[:page], per_page: 10
  end

  def create
    @library = Library.new params_library
    if @library.save
      @book = @library.book
      flash[:success] = "Adding book to library"
      redirect_to @book     
    else
      flash[:success] = "Don't create library"
    end
  end

  private
  
  def params_library
    params.permit :user_id, :book_id, :view_times
  end
end
