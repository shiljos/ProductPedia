class Product < ActiveRecord::Base
  has_many :users, :through => :favorites
  has_many :favorites
  has_many :bar_codes
  has_many :product_nuts
  has_many :nutritions, :through => :product_nuts
  has_many :product_ingredients
  has_many :ingredients, :through => :product_ingredients
  has_many :categories
  has_many :distributers
  has_many :companies, :through => :distributers
  has_many :new_infos

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
