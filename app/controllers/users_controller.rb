class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update, :index, :destroy]
  before_filter :correct_user, only: [:edit, :update]
  
  def new
    @user = User.new
    @primary = false
  end
  
  def signup
    @user = User.new
    @user.is_primary = "true"
    @user.updating_pw = "true"
  end
  
  def create
    @user = User.new(params[:user])
    
    if @user.save
      sign_in @user
      redirect_to @user, notice: "Welcome to Buyer"
    else
      render :new
    end
  end
  
  def show
    @user = User.find(params[:id])
    
    if @user.account_id
    @account = Account.find(@user.account_id)
  end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to user_path(@user), notice: "You have successfully updated your account"
    else
      render :edit
    end
  end
  
  def index
    @users = User.all
  end
  
  private
  
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
    
end