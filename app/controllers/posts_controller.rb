class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create destroy update edit]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params.merge(user_id: current_user.id))

    if @post.save
      redirect_to '/', notice: 'Post was created successfully!'
    else
      render :new
    end
  end

  def show
    @post = Post.find_by_id(params[:id])
    @comment = Comment.new
  end

  def update
    @post = current_user.posts.find_by_id(params[:id])

    if @post.update(post_params)
      redirect_to '/', notice: 'Post has been updated successfully!'
    else
      render :edit
    end
  end

  def edit
    @post = current_user.posts.find_by_id(params[:id])
  end

  def destroy
    @post = current_user.posts.find_by_id(params[:id])

    if @post.destroy
      redirect_to '/', notice: 'Post was successfully deleted!'
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :image, :category_id)
  end
end
