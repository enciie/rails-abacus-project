class GroupsController < ApplicationController

  def index
    @group = Group.new
    @groups = Group.all 
  end

end
