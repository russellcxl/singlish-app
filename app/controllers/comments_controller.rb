class CommentsController < ApplicationController
  def index
    @comment = Comment.new
    @user = User.find(current_user.id)
    @comments = Comment.all
  end

  def show
  end

  def new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
        # @comment.user_id = current_user.id # toknow who made the comment
    @comment['user_id'] = current_user.id
    @comment['post_id'] = @post.id
    if @comment.save
      redirect_to post_path(@post)
    else 
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:comments, :user_id, :post_id)
  end
end
