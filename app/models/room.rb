class Room < ApplicationRecord
    belongs_to :owner
    belongs_to :trainer
    has_many :messages, dependent: :destroy
    
  def unread_messages_count
    messages.where(read: false).count
  end
  
  def mark_messages_as_read(owner)
  messages.where(read: false).update_all(read: true)
end
end
