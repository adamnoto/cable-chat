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

  test "1 item in the text" do
    chat = Chat.new(text: "jual buku baru, 500.000")
    assert_equal 1, chat.items.length
  end

  test "2 items in the text" do
    chat = Chat.new(text: "jual buku baru, 500.000; ensiklopedia, 800.000")
    assert_equal 2, chat.items.length
  end

  test "item details with dots separating thousands" do
    chat = Chat.new(text: "jual buku baru, 500.000")
    assert_equal 500_000, chat.items[0][:price]
  end

  test "item details without separators" do
    chat = Chat.new(text: "jual buku baru, 500000")
    assert_equal 500_000, chat.items[0][:price]
  end
end
