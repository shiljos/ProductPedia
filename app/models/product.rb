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

  accepts_nested_attributes_for :bar_codes, :product_nuts

  attr_reader :ingredient_tokens
  attr_reader :nutrition_tokens
  attr_reader :distribution_company_tokens
  attr_reader :manufacture_company_tokens

  validates :name, :presence => true
  validates :description, :presence => true
  validates :category_id, :presence => true
  # validates :ingredient_tokens, :presence => true
  # validates :nutrition_tokens, :presence => true


  has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:styles/PixarBall.jpg"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

  searchkick text_start: [:name]

  # def self.search(search)
  # 	if search
  #     where("name LIKE ?", "%#{search}%")
  #     # find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
  # 	else
  #   	all
  # 	end
  # end

  def self.favorite_list(user)
    favorite_product_ids = user.product_ids
    where("id in (?)", favorite_product_ids)
  end

  def ingredient_tokens=(ids)
    self.ingredient_ids = ids.split(",")
  end

  def nutrition_tokens=(ids)
    self.nutrition_ids = ids.split(",")
  end

  def distribution_company_tokens=(ids)
    self.distribution_company_ids = ids.split(",")
  end

  def manufacture_company_tokens=(ids)
    self.manufacture_company_ids = ids.split(",")
  end  
end
