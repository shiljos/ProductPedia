class User < ActiveRecord::Base
  has_many :products, :through => :favorites
  has_many :favorites
  has_many :feeds
  has_many :new_infos, :through => :feeds
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
