class Product < ActiveRecord::Base
  has_many :users, :through => :favorites
  has_many :favorites
  has_many :bar_codes
  has_many :product_nuts
  has_many :nutritions, :through => :product_nuts
  has_many :product_ingredients
  has_many :ingredients, :through => :product_ingredients
  has_many :distributers
  has_many :distribution_companies, :through => :distributers, :source => :company
  has_many :new_infos
  has_many :manufacturers
  has_many :manufacture_companies, :through => :manufacturers, :source => :company
  belongs_to :category
  belongs_to :owner, class_name: "User"
  
  has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:styles/PixarBall.jpg"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

  def self.search(search)
  	if search
      where("name LIKE ?", "%#{search}%")
      # find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
  	else
    	all
  	end
  end
end
