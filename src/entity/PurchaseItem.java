package entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "PURCHASE_ITEM")
public class PurchaseItem {
	@Id
	@Column(name = "id")
	@GeneratedValue
	private int id;
	@ManyToOne
	@JoinColumn(name = "purchase_id")
	private Purchase purchase_id;
	@ManyToOne
	@JoinColumn(name = "color_id")
	private ProductColors productColors;
	@Column(name = "amount")
	private int amount;
	@Column(name = "price")
	private long price;

	public PurchaseItem() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PurchaseItem(Purchase purchase_id, ProductColors productColors, int amount, long price) {
		super();
		this.purchase_id = purchase_id;
		this.productColors = productColors;
		this.amount = amount;
		this.price = price;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Purchase getPurchase_id() {
		return purchase_id;
	}

	public void setPurchase_id(Purchase purchase_id) {
		this.purchase_id = purchase_id;
	}

	public ProductColors getProductColors() {
		return productColors;
	}

	public void setProductColors(ProductColors productColors) {
		this.productColors = productColors;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public long getPrice() {
		return price;
	}

	public void setPrice(long price) {
		this.price = price;
	}

}
