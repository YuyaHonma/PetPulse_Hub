class OwnerFavorite < ApplicationRecord
    belongs_to :owner
    belongs_to :post
end
