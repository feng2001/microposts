class UsersController < ApplicationController
   before_action :authenticate_user!, only: [:edit, :update, :destroy]

    
  
  def show 
   @user = User.find(params[:id])
  end
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    @user = current_user
  end
  
   def update
	     @user = current_user
	     @user.update(user_params)
       redirect_to user_url(@user)
    end
      
      
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                :password_confirmation,:prof)
  end
    def authenticate_user!
      unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to root_url
    end
  end
end