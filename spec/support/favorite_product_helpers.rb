module FavoriteProductHelpers
  def add_favorite
    sign_in
    visit product_path(@product)
    click_button 'Add to favorites'
  end
  def add_favorite_as(user, product)
  	visit product_path(product)
  	click_button 'Add to favorites'
  end
end

RSpec.configure do |config|
  config.include FavoriteProductHelpers
end