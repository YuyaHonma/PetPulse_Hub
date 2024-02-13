class Room < ApplicationRecord
    belongs_to :owner
    belongs_to :trainer
    has_many :messages, dependent: :destroy
end
