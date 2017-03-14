class GroupsController < ApplicationController
  before_action :set_group, only: [:edit, :update]

  def index
    @groups = current_user.groups.order("created_at ASC")
  end

  def new
   @group = Group.new
  end

  # def create
  #   @group = Group.new(group_params)
  #   if @group.save
  #    redirect_to groups_path, notice: "グループ#{group_params[:group_name]}が作成されました"
  #   else
  #     if @group.errors.include?(:group_name)
  #      redirect_to new_group_path, alert: "グループ名を入力してください。"
  #    else
  #      render 'new', alert: "名前を入力してください。"
  #   end
  #   end
  # end

  def create
    group = Group.new(group_params)
    if group.save
        redirect_to group_chats_path(group),notice:'グループが作成されました'
      else
        group.errors.full_messages.each do |error|
          flash[:alert] = error
        end
        redirect_to action: "new"
      end
  end


  def edit
  end

  def update
    if @group.update(group_params)
      if @group.users.include?(current_user)
    	  redirect_to group_messages_path @group.id, notice: "グループを変更しました。"
      else
        redirect_to root_path
      end
    else
      redirect_to edit_group_path @group.id, alert: "try again"
    end
  end

  private

  def group_params
  	params.require(:group).permit(:group_name, {:user_ids => []})
  end

  def set_group
    @group = Group.find(params[:id])
  end

end
