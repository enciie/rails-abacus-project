class GroupsController < ApplicationController

  def index
    @group = Group.new
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
  end


  private

  def group_params
    params.require(:group).permit(:name, :description)
  end



end
