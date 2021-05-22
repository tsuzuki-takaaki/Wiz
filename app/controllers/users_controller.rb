class UsersController < ApplicationController

  before_action :sign_in_required, only: [:show]

  def show
    @user = User.find_by(id: params[:id])
    @posts = @user.posts
  end

end
