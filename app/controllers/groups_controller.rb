class GroupsController < ApplicationController
  def new
   @group = Group.new
  end

  def create
   group = Group.new(group_params)
   group.save
   redirect_to controller: 'chats', action: 'index'
  end

  def edit
  	@group = Group.find(params[:id])
  end

  def update
  	group = Group.find(params[:id])
  	group.update(group_params)
  	redirect_to controller: 'chats', action: 'index'
  end

  private
  def group_params
  	params.require(:group).permit(:group_name)
  end
end
