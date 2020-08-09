class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :users_without_admin, only: [:index]

  def index
  end

  def show
    @user = User.find(params[:id])
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
    @users = @users.select { |x| x.role != "admin" }
  end

end
