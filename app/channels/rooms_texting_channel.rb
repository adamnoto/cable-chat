class RoomsTextingChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message(data)
    puts "Menerima pesan, params: #{params}, data: #{data}"
  end
end
