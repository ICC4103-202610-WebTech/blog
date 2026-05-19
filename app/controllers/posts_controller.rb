class PostsController < ApplicationController
  # before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  def index
    # @posts = Post.all
    @posts = policy_scope(Post)
    authorize @posts
  end

  def show
    @post = Post.find params[:id]
    authorize @post
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new post_params
    if post.save
      redirect_to post_path(post)
    else
      render :new
    end
  end


  private
  def post_params
    params.require(:post).permit(:title, :content, :body)
  end
end
