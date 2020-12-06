class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to '/', notice: 'Post was created successfully!'
    else
      render :new
    end
  end

  def show
    @post = Post.find_by_id(params[:id])
  end

  def update
    @post = Post.find_by_id(params[:id])

    if @post.update(post_params)
      redirect_to '/', notice: 'Post has been updated successfully!'
    else
      render :new
    end
  end

  def edit
    @post = Post.find_by_id(params[:id])
  end

  def destroy
    @post = Post.find_by_id(params[:id])

    if @post.destroy
      redirect_to '/', notice: 'Post was successfully deleted!'
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :image)
  end
end
