class Public::UsersController < ApplicationController
before_action :is_matching_login_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def edit

    @user = User.find(params[:id])
  end

  def update

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

   # ここから追加
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to public_posts_path
    end
  end
  # ここまで追加
end
