class NewInfo < ActiveRecord::Base
	belongs_to :product
	has_many :feeds
	has_many :users, :through => :feeds
end
