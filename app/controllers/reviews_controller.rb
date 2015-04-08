class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:new, :show, :index] 
  before_action :correct_user!, only: [:edit, :update, :destroy]

  before_filter :load_book

  def new
    @review = @book.reviews.build
  end

  def create
    @review = @book.reviews.build review_params
    @review.user_id = current_user.id
    if @review.save
      redirect_to @book, notice: "Review created succesfully!"
    else
      render :new
    end
  end

  def show
    @review = Review.find params[:id]
  end

  def edit
    @review = Review.find params[:id]
  end

  def update
    @review = Review.find params[:id]
    if @review.update_attributes review_params
      redirect_to [@book, @review],  notice: "Review updated!"
    end
  end

  private
    def review_params
      params.require(:review).permit :text, :rating_out_of_ten
    end

    def correct_user!
      @review = current_user.reviews.find_by id: params[:id]
      redirect_to root_url if @review.nil?
    end

    def load_book
      @book = Book.find params[:book_id]
    end
end
