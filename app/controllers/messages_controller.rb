class MessagesController < ApplicationController
  before_action :require_user

  def create
    @message = current_user.messages.build(message_params)
    if @message.save
      # redirect_to root_path
      # As we have more than one user, to broadcast
      # it makes more sense to use ActionCable rather than redirect
      ActionCable.server.broadcast(
        "chat_room_channel",
        content: message_render(@message)
      )
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end

  def message_render(message)
    render(partial: 'message', locals: { message: message })
  end
end
