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
  	else
  	  flash.now[:alert]  = 'メッセージの送信に失敗しました'
      render :index
    end
  end

  def index
  	@group   = Group.find(params[:group_id])
    @groups  = current_user.groups.order("created_at ASC")
    @message = Message.new
    # respond_to do |format|
    #   format.html
    #   format.json
    # end
  end

  private
  def message_params
    params.require(:message).permit(:body, :image).merge(user_id: current_user.id, group_id: params[:group_id])
  end
end

