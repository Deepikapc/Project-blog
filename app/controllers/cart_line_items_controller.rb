class CartLineItemsController < ApplicationController
	def index
		@cart_line_items = current_user.cart_line_items
	end
	def create
		@cart_line_item = CartLineItem.new(cart_line_params)
		 @cart_line_item.user_id = current_user.id
		 if @cart_line_item.save
		 	redirect_to cart_line_items_path,notice:"You have added article to product successfully"
		else
			render :"show"
		end
end
	private 
		def cart_line_params
			params[:cart_line_item].permit(:article_id,:quantity)
		end
end
