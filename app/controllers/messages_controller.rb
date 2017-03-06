class MessagesController < ApplicationController
  def create
  	message = Message.new(message_params)
  	if message.body.blank?
  	  redirect_to :back
  	  flash[:alert] = "メッセージを入力してください。"
  	else
  	  message.save
  	  redirect_to :back
    end
  end

  def index
  	@group = Group.find(params[:group_id])
    @groups = Group.all
    @message = Message.new
  end

  private
  def message_params
   params.require(:message).permit(:body).merge(user_id: current_user.id, group_id: params[:group_id])
  end
end
