class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :first_name,
    format:{ with: /\A[ぁ-んァ-ン一-龥]/ }, presence: true
  validates :first_name_katakana,
    format:{ with: /\A[ァ-ヶー－]+\z/ }, presence: true
  validates :family_name,
    format:{ with: /\A[ぁ-んァ-ン一-龥]/ }, presence: true
  validates :family_name_katakana,
    format:{ with: /\A[ァ-ヶー－]+\z/ }, presence: true
  validates :birthday, presence: true

end
