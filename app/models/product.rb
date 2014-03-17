class Product < ActiveRecord::Base
  has_many :users, :through => :favorites
  has_many :favorites

  has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

  def self.search(search)
  	if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
  	else
    	find(:all)
  	end
  end
end
