class Public::UsersController < ApplicationController
 

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    #is_matching_login_user
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to public_user_path(@user.id)
    else
      render :edit
    end  
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :email, :encrypted_password)
  end
end
