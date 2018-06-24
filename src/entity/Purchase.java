package entity;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="PURCHASE")
public class Purchase {
	@Id
	@Column(name="id")
	@GeneratedValue
	private int id;
	@OneToMany(mappedBy="purchase_id",fetch  = FetchType.EAGER)
	private Collection<PurchaseItem> purchase_item;
	@ManyToOne
	@JoinColumn(name="client_id")
	private Users username;
	@Column(name="client_address")
	private String client_address;
	@Column(name="client_phone")
	private String client_phone;
	@Column(name="status")
	private String status;
	public Purchase() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

	public Purchase(Collection<PurchaseItem> purchase_item, Users username,
			String client_address, String client_phone, String status) {
		super();
		this.purchase_item = purchase_item;
		this.username = username;
		this.client_address = client_address;
		this.client_phone = client_phone;
		this.status = status;
	}	



	public Purchase(Users username, String client_address, String client_phone, String status) {
		super();
		this.username = username;
		this.client_address = client_address;
		this.client_phone = client_phone;
		this.status = status;
	}



	public Collection<PurchaseItem> getPurchase_item() {
		return purchase_item;
	}
	public void setPurchase_item(Collection<PurchaseItem> purchase_item) {
		this.purchase_item = purchase_item;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Users getUsername() {
		return username;
	}
	public void setUsername(Users username) {
		this.username = username;
	}
	public String getClient_address() {
		return client_address;
	}
	public void setClient_address(String client_address) {
		this.client_address = client_address;
	}
	public String getClient_phone() {
		return client_phone;
	}
	public void setClient_phone(String client_phone) {
		this.client_phone = client_phone;
	}



	public String getStatus() {
		return status;
	}



	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
}
