class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable
  validates :nickname, presence: true, length: { maximum: 20 }

  has_many :cards
  has_many :products , foreign_key: "seller_id"
  has_many :statuses , foreign_key: "buyer_id"
end

