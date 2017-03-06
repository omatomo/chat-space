class GroupsController < ApplicationController

  def index
    @groups = Group.all
  end

  def new
   @group = Group.new
  end

  def create
   Group.create(group_params)
   name = group_params[:group_name]
   flash[:notice] = "グループ#{name}が作成されました"
   redirect_to action: 'index'
  end

  def edit
  	@group = Group.find(params[:id])
  end

  def update
  	group = Group.find(params[:id])
  	group.update(group_params)
    group_id = group.id
  	redirect_to group_messages_path group_id
    flash[:notice] = "グループを変更しました。"
  end

  private
  def group_params
  	params.require(:group).permit(:group_name, {:user_ids => []})
  end
end
