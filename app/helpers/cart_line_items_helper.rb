module CartLineItemsHelper
	def cartline(cart_line_item)
		total = 0
		cart_line_item.product.price * cart_line_item.quantity
		total += cart_line_item.product.price * cart_line_item.quantity
	end
end
