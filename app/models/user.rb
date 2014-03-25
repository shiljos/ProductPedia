class User < ActiveRecord::Base
  has_many :products, :through => :favorites
  has_many :favorites
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def feed
    NewInfo.for_products_favored_by(self)
  end
end


