class Public::PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to public_posts_path
    else
      render :new
    end

  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])

  end

  def edit

    @post = Post.find(params[:id])
  end

  def update

    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to public_post_path
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to public_posts_path
  end

  private

  def post_params
    params.require(:post).permit(:user_id, :title, :introduction, :image, :adress)
  end
end
