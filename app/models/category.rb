class Category < ApplicationRecord
    has_many :trainer_categories
    has_many :trainers, through: :trainer_categories
    has_many :posts, dependent: :destroy
    
    validates :name, presence: true, uniqueness: true, length: {in: 2..20}
    
    def post_count
      posts.count
    end
end
