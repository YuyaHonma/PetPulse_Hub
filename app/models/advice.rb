class Advice < ApplicationRecord
   belongs_to :trainer
   belongs_to :post
   
   validates :advice, presence: true
end
