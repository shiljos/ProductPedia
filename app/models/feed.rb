class Feed < ActiveRecord::Base
	belongs_to :new_info
	belongs_to :user
end
