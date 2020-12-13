class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create destroy update edit]
  before_action :set_post, only: %i[edit update destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @categories = Category.where(status: 'ativo').map { |category| [category.name, category.id] }
  end

  def create
    @post = Post.new(post_params.merge(user_id: current_user.id))
    category = Category.find_by_id!(@post.category_id)

    if category.status == 'inativo'
      redirect_to '/', notice: 'I'
    elsif @post.save
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
    if @post.update(post_params)
      redirect_to '/', notice: 'Post has been updated successfully!'
    else
      render :edit
    end
  end

  def edit
  end

  def destroy
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

  def set_post
    @post = current_user.posts.find_by_id(params[:id])
  end
end
