class UsersController < ApplicationController
  
  def show
    @user = User.find_by(id: params[:id])
    if @user.nil?
      flash[:notice] = "User not found"
    end
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      log_in @user
      flash[:success] = "Successfully created user."
      redirect_to @user   #same as user_url(@user)
    else
      render :new
    end
  end

  private 
    def user_params 
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end


end
