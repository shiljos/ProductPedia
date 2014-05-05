class User < ActiveRecord::Base
  has_many :products, :through => :favorites
  has_many :favorites
  has_many :owned_products, class_name: "Product", foreign_key: "owner_id"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
 
  after_create do
   subscribe_to_mailchimp 
  end

  def feed
    NewInfo.for_products_favored_by(self)
  end

  def favorite
    Product.favorite_list(self)
  end
end

def subscribe_to_mailchimp testing=false
   return true if (Rails.env.test? && !testing)

   list_id = '03d9a5d4be'

   response = Rails.configuration.mailchimp.lists.subscribe({
    id: list_id,
    email: {email: email},
    double_optin: false
    })
   response
end