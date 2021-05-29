class PostsController < ApplicationController

  before_action :authenticate_user!, {only:[:new, :create, :edit, :update, :destroy]}
  before_action :ensure_correct_user, {only:[:edit, :update, :destroy]}

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to(post_path(@post.id))
  end
  
  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user
    if user_signed_in?
      @like = Like.find_by(user_id: current_user.id, post_id: @post.id)
    end
    @likes_count = Like.where(post_id: @post.id).count
    @comment = Comment.new
    @comments = @post.comments.includes(:user, :post).order(created_at: :asc)
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post = @post.update(post_params)
    redirect_to(root_path)
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to(root_path)
  end

  def ensure_correct_user
    @post = Post.find_by(id: params[:id])
    if @post.user_id != current_user.id
      flash[:notice] ="権限がありません"
      redirect_to(root_path)
    end
  end

  private

   def post_params
    params.require(:post).permit(:image_name1, :country, :howlong, :visa, :schoolname, :city, :money, :agent, :necessity).merge(user_id: current_user.id)
   end

end
