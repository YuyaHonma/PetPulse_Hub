class Room < ApplicationRecord
    belongs_to :owner
    belongs_to :trainer
    has_many :messages, dependent: :destroy
    
    def unread_messages_count
    messages.where(read: false).count
  end
end
