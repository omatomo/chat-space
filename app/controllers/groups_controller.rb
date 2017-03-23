class GroupsController < ApplicationController
  before_action :set_group, only: [:edit, :update]

  def index
    @groups = current_user.groups.order("created_at ASC")
  end

  def new
   @group = Group.new
   @group.users << current_user
  end

  def create
    @group = Group.new(group_params)
    if @group.save
        redirect_to root_path,notice:'グループが作成されました'
      else
        @group.errors.full_messages.each do |error|
          flash[:alert] = error
        end
        render :action => :new
    end
  end


  def edit
    @users = User.where.not(id: current_user)
    @members = @group.users.where.not(id: current_user)
    @group = Group.find(params[:id])
  end

  def update
    if @group.update(group_params)
    	  redirect_to group_messages_path @group.id, notice: "グループを変更しました。"
    else
      redirect_to edit_group_path @group.id
      flash[:alert] = "try again"
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
