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


#zamijenjene funkcije privremeno su tu
# def list_favorite_products(user)
#   favorite_list = user.favorites
#   fav_products = []
#   favorite_list.each do |fav|
#     prod = Product.find(fav.product_id)
#     fav_products << prod
#   end
#   return fav_products   
# end

# def favorites_news_feed(user)
#   favorites = user.favorites
#   all_news = user.new_infos
#   news = []
#   all_news.each do |n|
#     favorites.each do |fav|
#       if n.product_id == fav.product_id
#         news << n
#       end
#     end
#   end
#   return news
# end
