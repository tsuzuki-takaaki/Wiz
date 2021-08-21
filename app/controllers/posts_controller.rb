class PostsController < ApplicationController

  before_action :authenticate_user!, {only:[:new, :create, :edit, :update, :destroy]}
  before_action :ensure_correct_user, {only:[:edit, :update, :destroy]}

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to(post_path(@post.id))
    else
      render("posts/new")
    end
  end
  
  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user
    @comment = Comment.new
    @comments = @post.comments.includes(:user, :post).order(created_at: :asc)
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    if @post.update(post_params)
      redirect_to(root_path)
    else
      render("posts/edit")
    end
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
