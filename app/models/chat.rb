class Chat < ApplicationRecord
  validates_presence_of :text
  validates_presence_of :sender_id

  after_create_commit { ChatBroadcasterJob.perform_now(self) }

  belongs_to :sender, class_name: User

  ITEMABLE_REGEX = /\A.*jual\s+/i

  def itemable?
    !(text =~ ITEMABLE_REGEX).nil?
  end

  def items
    []
  end
end
