class HomeController < ApplicationController

  def top
    @posts = Post.all
  end

end
