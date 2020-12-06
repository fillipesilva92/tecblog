class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to '/comments', notice: 'Comment was created successfully!'
    else
      render :new
    end
  end

  def show
    @comment = Comment.find_by_id(params[:id])
  end

  def update
    @comment = Comment.find_by_id(params[:id])

    if @comment.update(comment_params)
      redirect_to '/comments', notice: 'Comment has been updated successfully!'
    else
      render :new
    end
  end

  def edit
    @comment = Comment.find_by_id([:id])
  end

  def destroy
    @comment = Comment.find_by_id(params[:id])

    if @comment.destroy
      redirect_to '/comments', notice: 'Comment was successfully deleted!'
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :content, :rating)
  end
end