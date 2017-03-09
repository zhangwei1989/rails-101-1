class Account::PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  def index
    @posts = current_user.posts
  end


  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to posts_path, notic: "Update Success"
  end

  def destroy
    @group = Group.find(params[:group_id])
    @post = Post.find(post_params)
    @post.destroy
    flash[:alert] = "Post deleted"
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
