class RequestsController < ApplicationController
  before_action :authenticate_user!, except: [:new, :show, :index] 
  before_action :correct_user!, only: [:edit, :update, :destroy]

  before_filter :load_user

  def index
    @requests = @user.requests.order created_at: :desc
    @requests = @requests.paginate page: params[:page], per_page: 10
  end

  def create
    @request = @user.requests.build request_params
    if @request.save
      redirect_to user_requests_path @user, notice: "Request created!"
    else
      render 'new'
    end
  end

  def new
    @request = Request.new
  end

  def show
    @request = Request.find params[:id]
  end

  def destroy
    @request = Request.find params[:id].destroy
    redirect_to user_requests_path, notice: "Request cancel!"
  end

  private

  def load_user
    @user = User.find params[:user_id]
  end

  def request_params
    params.require(:request).permit :title, :content
  end

  def correct_user!
    @user = User.find params[:user_id]
    redirect_to root_url if @request.nil?
  end
end
