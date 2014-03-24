module FavoriteProductHelpers
  def add_favorite
    sign_in
    visit product_path(@product)
    click_link 'Add'
  end
  def add_favorite_as(user, product)
  	visit product_path(product)
  	click_link 'Add'
  end
end

RSpec.configure do |config|
  config.include FavoriteProductHelpers
end