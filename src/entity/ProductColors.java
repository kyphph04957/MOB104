package entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "PRODUCT_COLORS")
public class ProductColors implements Serializable {
	/**
	 * 
	 */

	@Id
	@GeneratedValue
	@Column(name = "id")
	private int id;
	@ManyToOne
	@JoinColumn(name = "product_id")
	private Product product;
	@Column(name = "color")
	private String color;
	@Column(name = "img_front")
	private String img_front;
	@Column(name = "img_behind")
	private String img_behind;
	@Column(name = "img_thickness")
	private String img_thickness;
	private static final long serialVersionUID = 1L;

	public ProductColors() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ProductColors(Product product, String color, String img_front, String img_behind,
			String img_thickness) {
		super();
		this.product = product;
		this.color = color;
		this.img_front = img_front;
		this.img_behind = img_behind;
		this.img_thickness = img_thickness;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getImg_front() {
		return img_front;
	}

	public void setImg_front(String img_front) {
		this.img_front = img_front;
	}

	public String getImg_behind() {
		return img_behind;
	}

	public void setImg_behind(String img_behind) {
		this.img_behind = img_behind;
	}

	public String getImg_thickness() {
		return img_thickness;
	}

	public void setImg_thickness(String img_thickness) {
		this.img_thickness = img_thickness;
	}

}
