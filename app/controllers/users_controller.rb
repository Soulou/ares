class UsersController < ApplicationController
  load_and_authorize_resource :group, find_by: :name
  load_and_authorize_resource :user, find_by: :username, through: :group, shallow: true

  def index
    respond_with @users
  end

  def show
    respond_with @user
  end

  def create
    @user.save
    respond_with @user, location: users_path
  end

  def update
    @user.update_attributes(params[:user])
    respond_with @user, location: users_path
  end

  def destroy
    respond_with @user.destroy, location: users_path
  end

  def self
    @user = current_user
    respond_with @user
  end

  protected
    def test
      @user = User.find_by_username(params[:id])
    end
end
