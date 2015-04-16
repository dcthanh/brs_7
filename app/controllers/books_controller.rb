class BooksController < ApplicationController
  def index
    if params[:type].present?
      @books = Book.find_book params[:search], params[:type]
    else
      @books = Book.all
    end
    @books = @books.paginate page: params[:page], per_page: 10
  end

  def show
    @book = Book.find params[:id]
  end
end

