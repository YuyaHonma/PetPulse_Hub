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
    
    def get_profile_image(width, height)
      unless profile_image.attached?
        file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
        profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
      end
      profile_image.variant(resize_to_limit: [width, height]).processed
    end
    
    def owner_favorited_by?(owner)
        owner_favorites.exists?(owner_id: owner.id)
    end
    
    def trainer_favorited_by?(trainer)
        trainer_favorites.exists?(trainer_id: trainer.id)
    end
    
    def self.search_for(title)
        Post.where('title LIKE ?', '%'+title+'%')
    end
end
