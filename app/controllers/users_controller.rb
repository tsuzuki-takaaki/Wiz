class UsersController < ApplicationController

  before_action :authenticate_user, {only:[:show]}
  before_action :fobid_login_user, {only:[:new, :create, :login_form, :login]}

  def new
    @user = User.new
  end

  def show
    @user = User.find_by(id: params[:id])
    @posts = @user.posts
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "登録が完了しました"
      redirect_to(user_path(@user.id))
    else
      render("users/new")
    end
  end

  def login_form
  end

  def login
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/users/#{@user.id}")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render("users/login_form")
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/")
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end

end
