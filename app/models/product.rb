class Product < ActiveRecord::Base
  has_many :users, :through => :favorites
  has_many :favorites

  def self.search(search)
  	if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
  	else
    	find(:all)
  	end
  end
end
