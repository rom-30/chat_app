class ChatRoomsController < ApplicationController
  before_action :require_user

  def index
    @messages = Message.all
  end
end
