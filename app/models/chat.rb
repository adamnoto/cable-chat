class Chat < ApplicationRecord
  validates_presence_of :text
  validates_presence_of :sender_id
end
