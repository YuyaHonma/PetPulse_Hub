class TrainerFavorite < ApplicationRecord
    belongs_to :trainer
    belongs_to :post
end
