class CommentsController < ApplicationController

  def create
    @post = Post.find_by(id: params[:post_id])
    @user = @post.user
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    @comments = @post.comments.order(created_at: :asc)
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @comment.destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end

end
