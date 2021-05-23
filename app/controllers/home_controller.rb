class HomeController < ApplicationController

  def top
    @posts = Post.all
  end

  def usa
    @posts = Post.where(country: "USA")
  end

  def uk
    @posts = Post.where(country: "UK")
  end

  def canada
    @posts = Post.where(country: "Canada")
  end

  def australia
    @posts = Post.where(country: "Australia")
  end

  def newzealand
    @posts = Post.where(country: "NewZealand")
  end

  def southafrica
    @posts = Post.where(country: "SouthAfrica")
  end

  def malta
    @posts = Post.where(country: "Malta")
  end

  def philippines
    @posts = Post.where(country: "thePhilippines")
  end
  
end
