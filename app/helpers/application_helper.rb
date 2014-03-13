module ApplicationHelper
  
  def product_is_favorite(user, product)
  	@fav = Favorite.where(user_id: user.id, product_id: product.id)
  	if @fav 
  	  return true
  	else 
  	  return false
  	end
  end
end
