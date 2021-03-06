class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :users_without_admin, only: [:index]
  before_action :nav_tags

  def index
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: @user.id)
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

  def users_without_admin
    @users = User.all
    @users = @users.select { |user| user.role != "admin" }
  end

  def nav_tags
    @tags = Tag.all
  end

end
