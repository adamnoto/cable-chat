module RoomsHelper
  def all_chats
    Chat.all.order("id ASC")
  end
end
