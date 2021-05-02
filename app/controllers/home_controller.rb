class HomeController < ApplicationController

  def top
    @posts = Post.all
  end

  def usa
    @posts = Post.where(country:"USA")
  end

  def uk
  end

  def canada
    @posts = Post.where(country:"Canada")
  end

  def australia
  end

  def newzealand
  end

  def southafrica
  end

  def malta
  end

  def philippines
  end
  
end
