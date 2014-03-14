module ApplicationHelper
  
  def product_is_favorite(user, product)
  	results = Favorite.where(user_id: user.id, product_id: product.id)
  	unless results.empty?
  	  return true
  	else
  	  return false
  	end
  end

  def favorite_product_name(user, product)
  	results = Favorite.where(user_id: user.id, product_id: product.id)
  	unless results.empty?
  	  return product.name
  	else
  	  return ' '
  	end
  end
end
