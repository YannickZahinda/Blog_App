class CommentsController < ApplicationController
  def new
    @user = current_user
    # @user = User.find(params[:user_id])
    @comment = @user.posts.find(params[:post_id]).comments.new
  end

  def create
    @comment = Comment.new(comment_params)
    @user = current_user
    # @user = User.find(params[:user_id])
    @comment.user_id = params[:user_id]
    @comment.post_id = params[:post_id]

    if @comment.save
      redirect_to user_post_path(@comment.user, @comment.post)
    else
      render 'new'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
