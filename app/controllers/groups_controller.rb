class GroupsController < ApplicationController
  load_and_authorize_resource find_by: :name

  def index
    respond_with @groups
  end

  def show
    respond_with @group
  end

  def new
  end

  def create
    respond_with @group.save, location: groups_path
  end

  def update
    @group.update_attributes params[:group]
    respond_with @group, location: groups_path
  end

  def destroy
    respond_with @group.destroy, location: groups_path
  end
end
