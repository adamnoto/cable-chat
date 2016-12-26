class RoomsTextingChannel < ApplicationCable::Channel
  def subscribed
    stream_from "rooms_texting_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message(data)
    ChatBroadcasterJob.perform_now(Chat.create(
      text: data["message"],
      sender: User.first
    ))
  end
end
