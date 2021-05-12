class PostsController < ApplicationController

  before_action :authenticate_user, {only:[:new, :create, :edit, :update, :destroy]}
  before_action :ensure_correct_user, {only:[:edit, :update, :destroy]}

  def new
  end

  def create
    @post = Post.new(
      country: params[:country],
      howlong: params[:howlong],
      visa: params[:visa],
      schoolname: params[:schoolname],
      user_id: @current_user.id,
      city: params[:city],
      money: params[:money],
      agent: params[:agent],
      necessity: params[:necessity])
    @post.save
    redirect_to("/posts/#{@post.id}")
  end
  
  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user
    @like = Like.find_by(user_id: @current_user.id, post_id: @post.id)
    @likes_count = Like.where(post_id: @post.id).count
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.country = params[:country]
    @post.howlong = params[:howlong]
    @post.visa = params[:visa]
    @post.schoolname = params[:schoolname]
    @post.save
    redirect_to("/")
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to("/")
  end

  def ensure_correct_user
    @post = Post.find_by(id: params[:id])
    if @post.user_id != @current_user.id
      flash[:notice] ="権限がありません"
      redirect_to("/")
    end
  end

end
