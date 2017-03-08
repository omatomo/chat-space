class GroupsController < ApplicationController

  def index
    @groups = current_user.groups.order("created_at ASC")
  end

  def new
   @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
     flash[:notice] = "グループ#{group_params[:group_name]}が作成されました"
     redirect_to action: 'index'
    else
     flash[:alert] = "グループ名を入力してください"
     redirect_to :back
    end
  end

  def edit
  	@group = Group.find(params[:id])
  end

  def update
  	group = Group.find(params[:id])
  	group.update(group_params)
  	redirect_to group_messages_path group.id
    flash[:notice] = "グループを変更しました。"
  end

  private
  def group_params
  	params.require(:group).permit(:group_name, {:user_ids => []})
  end
end
