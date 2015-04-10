class LibrariesController < ApplicationController

  def index
    @books = current_user.myLibrary.paginate page: params[:page], per_page: 10
  end

  def create
    @library = Library.new params_library
    @book = @library.book
    @library.save
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @library = Library.find params[:id]
    @book = @library.book
    @library.destroy
    respond_to do |format|
      format.js
    end
  end

  private
  
  def params_library
    params.permit :user_id, :book_id, :view_times
  end
end
