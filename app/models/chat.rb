class Chat < ApplicationRecord
  validates_presence_of :text
  validates_presence_of :sender_id

  after_create_commit { ChatBroadcasterJob.perform_now(self) }

  belongs_to :sender, class_name: User
end
