package dao;

import java.util.HashMap;
import org.springframework.stereotype.Component;

import entity.Cart;

@Component
public class CartDao extends HashMap<String, Cart> {
	private static final long serialVersionUID = 1L;

	public CartDao() {
		// TODO Auto-generated constructor stub
	}

	public void addToCart(Cart cart, String color) {
		if (this.containsKey(cart.getProduct_id()+color)) {
			String productColor =((Cart)this.get(cart.getProduct_id()+color)).getColor();
				if (color.equals(productColor)) {
					int oldQuantity = ((Cart) this.get(cart.getProduct_id()+color)).getQuantity();
					((Cart) this.get(cart.getProduct_id()+color)).setQuantity(oldQuantity + 1);
				} else {
					this.put(cart.getProduct_id()+color, cart);
				}

		} else {
			this.put(cart.getProduct_id()+color, cart);
		}
	}
	
	public void removeToCart(String id,String color) {
		if(this.containsKey(id+color)) {
			this.remove(id+color);
		}
	}
	
	public long getTotalPrice() {
		long totalPrice=0;
		for(String product: this.keySet()) {
			totalPrice+= this.get(product).getProductColor().getProduct().getPrice() * this.get(product).getQuantity();
		}
		return totalPrice;
	}
}
