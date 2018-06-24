package entity;

import java.io.Serializable;

public class Cart implements Serializable {

	private static final long serialVersionUID = 1L;
	private String product_id;
	private ProductColors productColor;
	private int quantity ;
	private String color;
	public Cart() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Cart(String product_id, ProductColors productColor,String color) {
		super();
		this.product_id = product_id;
		this.productColor = productColor;
		this.quantity = 1;
		this.color = color;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public ProductColors getProductColor() {
		return productColor;
	}
	public void setProductColor(ProductColors productColor) {
		this.productColor = productColor;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	
}
