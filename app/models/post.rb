class Post < ApplicationRecord
    
    has_one_attached :image
    belongs_to :owner
    belongs_to :category
    has_many :advices, dependent: :destroy
    has_many :owner_favorites, dependent: :destroy
    has_many :trainer_favorites, dependent: :destroy
    
    validates :title, presence: true, length: { maximum: 100 }
    validates :category_id, presence: true
    validates :image, presence: true
    validates :introduction, presence: true, length: { maximum: 500 }
    validates :current_approach, presence: true, length: { maximum: 300 }
    
    def owner_favorited_by?(owner)
        owner_favorites.exists?(owner_id: owner.id)
    end
    
    def trainer_favorited_by?(trainer)
        trainer_favorites.exists?(trainer_id: trainer.id)
    end
    
    
end
