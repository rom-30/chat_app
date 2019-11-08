class ChatRoomsController < ApplicationController
  def index
    @messages = Message.all
  end
end
