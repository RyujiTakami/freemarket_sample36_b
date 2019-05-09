class Product < ApplicationRecord
  has_many :images, foreign_key: "item_id", dependent: :delete_all
  has_many :statuses, foreign_key: "item_id", dependent: :delete_all
  has_many :item_categories, foreign_key: "item_id", dependent: :delete_all
  belongs_to :user, foreign_key: "seller_id"

  validates :name, :introduce, :condition, :delivery_fee_payer, :shipping_method, :area, :days_to_delivery, :price, :seller_id, :parent_category_id, :child_category_id, :grandchild_category_id, presence: true

end
