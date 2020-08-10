class TagsController < ApplicationController
  before_action :nav_tags
  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
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
