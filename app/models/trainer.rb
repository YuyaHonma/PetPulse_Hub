class Trainer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :image
  
  has_many :trainer_categories
  has_many :categories, through: :trainer_categories
  has_many :advices, dependent: :destroy
  has_many :rooms, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :trainer_favorites, dependent: :destroy
  
  validates :name, presence: true
  validates :name_kana, presence: true
  validates :email, presence: true    
  validates :telephone, presence: true
  validates :address, presence: true
  
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      profile_image.variant(resize_to_limit: [width, height]).processed
  end
  
  
  def public_trainer_status
    if is_active == true
      "有効"
    else
      "退会"
    end
  end
  
  def guest?
    email == 'test@test'
  end
  
  def self.guest
    find_or_create_by(email: 'test@test') do |trainer|
      trainer.name = 'ゲスト'
      trainer.name_kana = 'ゲスト'
      trainer.telephone = 'test'
      trainer.address = 'test'
      trainer.password = SecureRandom.urlsafe_base64
    end
  end
  
  
end
