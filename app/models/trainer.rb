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
  
  validates :name, presence: true
  validates :name_kana, presence: true
  validates :email, presence: true    
  validates :telephone, presence: true
  validates :address, presence: true
  
  
  def public_trainer_status
    if is_active == true
      "有効"
    else
      "退会"
    end
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
