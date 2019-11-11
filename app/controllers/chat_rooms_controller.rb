class ChatRoomsController < ApplicationController
  before_action :require_user

  def index
    @message = Message.new
    # 2 options
    # 1. Active record used in controller or
    # @messages = Message.order(created_at: :asc).last(20)
    # 2. scope defined in Message model
    @messages = Message.last_20

  end
end
