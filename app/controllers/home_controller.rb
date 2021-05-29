class HomeController < ApplicationController

  def top
    @posts = Post.all.includes(:user)
  end

  def usa
    @posts = Post.where(country: "USA").includes(:user)
  end

  def uk
    @posts = Post.where(country: "UK").includes(:user)
  end

  def canada
    @posts = Post.where(country: "Canada").includes(:user)
  end

  def australia
    @posts = Post.where(country: "Australia").includes(:user)
  end

  def newzealand
    @posts = Post.where(country: "NewZealand").includes(:user)
  end

  def southafrica
    @posts = Post.where(country: "SouthAfrica").includes(:user)
  end

  def malta
    @posts = Post.where(country: "Malta").includes(:user)
  end

  def philippines
    @posts = Post.where(country: "thePhilippines").includes(:user)
  end
  
end
