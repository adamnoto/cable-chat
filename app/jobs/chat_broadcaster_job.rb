class ChatBroadcasterJob < ApplicationJob
  queue_as :default

  def perform(chat)
    ActionCable.server.broadcast "rooms_texting_channel",
      chat: render_message(chat)
  end

  private

  def render_message(chat)
    RoomsController.render partial: "rooms/chat",
      locals: {chat: chat}
  end
end
