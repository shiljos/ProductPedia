class NewInfo < ActiveRecord::Base
  belongs_to :product

  def self.for_products_favored_by(user)
    product_ids = user.product_ids
    where("product_id in (?)", product_ids).order('created_at desc')
  end
end
