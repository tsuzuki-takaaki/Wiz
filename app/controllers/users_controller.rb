class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:show]
  before_action :only_self_user, only: [:show]

  def show
    @user = User.find_by(id: params[:id])
    @posts = @user.posts
  end

  def only_self_user
    @user = User.find_by(id: params[:id])
    if @user.id != current_user.id
      flash[:notice] ="権限がありません"
      redirect_to(root_path)
    end
  end
  
end
