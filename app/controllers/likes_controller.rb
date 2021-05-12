class LikesController < ApplicationController

  before_action :authenticate_user

  def create
    @post = Post.find_by(id: params[:post_id])
    @like = Like.new(user_id: @current_user.id, post_id: params[:post_id])
    @like.save
    @likes_count = Like.where(post_id: @post.id).count
  end

  def destroy
    @post = Post.find_by(id: params[:post_id])
    @like = Like.find_by(user_id: @current_user.id, post_id: params[:post_id])
    @like.destroy
    @likes_count = Like.where(post_id: @post.id).count
  end

end