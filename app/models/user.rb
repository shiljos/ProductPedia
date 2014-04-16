class User < ActiveRecord::Base
  has_many :products, :through => :favorites
  has_many :favorites
  has_many :owned_products, class_name: "Product", foreign_key: "owner_id"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #jenkins
  
  def feed
    NewInfo.for_products_favored_by(self)
  end

  def favorite
    Product.favorite_list(self)
  end
end


