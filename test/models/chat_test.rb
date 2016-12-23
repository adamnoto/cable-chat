require 'test_helper'

class ChatTest < ActiveSupport::TestCase
  test "it must belong to sender" do
    chat = Chat.new(text: "Hai!")
    chat.save
    assert_not chat.valid?
  end

  test "can be saved to the database" do
    user = users(:adam)
    chat = Chat.new(text: "Hai!", sender: user)
    chat.save
    assert chat.persisted?
  end
end
