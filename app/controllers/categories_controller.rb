class CategoriesController < ApplicationController
  before_action :nav_tags
  def index
    @posts = Post.all
  end

  def show
    @posts = Post.all.select { |post| post.word[0].upcase === params[:id].upcase } # selects only posts start with letter in URL query
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def nav_tags
    @tags = Tag.all
  end

end
