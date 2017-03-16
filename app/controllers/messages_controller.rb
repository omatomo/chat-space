class MessagesController < ApplicationController
  def create
  	@message = Message.new(message_params)
    @group = Group.find(params[:group_id])
    @groups  = current_user.groups.order("created_at ASC")
  	if @message.save
      respond_to do |format|
        format.html {redirect_to group_messages_path(params[:group_id])}
        format.json
      end
  	  flash[:notice] = "メッセージ入力成功しました。"
  	else
  	  flash.now[:alert] = 'メッセージの送信に失敗しました'
      render :index
    end
  end

  def index
  	@group   = Group.find(params[:group_id])
    @groups  = current_user.groups.order("created_at ASC")
    @message = Message.new
  end

  private
  def message_params
    params.require(:message).permit(:body).merge(user_id: current_user.id, group_id: params[:group_id])
  end
end

