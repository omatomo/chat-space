class ChatsController < ApplicationController
  def index
  	@group = Group.find(1)
  end
end
