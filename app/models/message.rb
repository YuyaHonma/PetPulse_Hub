class Message < ApplicationRecord
    belongs_to :owner
    belongs_to :trainer
    belongs_to :room
    
    
end
