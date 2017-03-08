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
     redirect_to groups_path, notice: "グループ#{group_params[:group_name]}が作成されました"
    else
     redirect_to new_group_path, alert: "グループ名を入力してください"
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
    	@group.update(group_params)
    	redirect_to group_messages_path @group.id, notice: "グループを変更しました。"
    else
      redirect_to edit_group_path @group.id, alert: "try again"
    end
  end

  private

  def group_params
  	params.require(:group).permit(:group_name, {:user_ids => []})
  end

end
