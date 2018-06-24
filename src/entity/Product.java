package entity;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="PRODUCT")
public class Product {
	@Id
	@Column(name="id")
	private String id;
	@OneToMany(mappedBy="product",fetch= FetchType.EAGER)
	private List<ProductColors> product_colors = new ArrayList<>();
	@Column(name="name")
	private String name;
	@Column(name="price")
	private long price;
	@Column(name="producer")
	private String producer;
	@Column(name="amount")
	private int amount;
	@Column(name="monitor")
	private String monitor;
	@Column(name="os")
	private String os;
	@Column(name="camera")
	private String camera;
	@Column(name="front_camera")
	private String front_camera;
	@Column(name="cpu")
	private String cpu;
	@Column(name="ram")
	private String ram;
	@Column(name="ROM")
	private String rom;
	@Column(name="sim")
	private String sim;
	@Column(name="pin")
	private String pin;
	@Column(name="description")
	private String description;
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Product(String id, String name, long price, String producer, int amount, String monitor, String os,
			String camera, String front_camera, String cpu, String ram, String rom, String sim, String pin,
			String description) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.producer = producer;
		this.amount = amount;
		this.monitor = monitor;
		this.os = os;
		this.camera = camera;
		this.front_camera = front_camera;
		this.cpu = cpu;
		this.ram = ram;
		this.rom = rom;
		this.sim = sim;
		this.pin = pin;
		this.description = description;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public long getPrice() {
		return price;
	}
	public void setPrice(long price) {
		this.price = price;
	}
	public String getProducer() {
		return producer;
	}
	public void setProducer(String producer) {
		this.producer = producer;
	}
	public List<ProductColors> getProduct_colors() {
		return product_colors;
	}
	public void setProduct_colors(List<ProductColors> product_colors) {
		this.product_colors = product_colors;
	}

	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}

	public String getMonitor() {
		return monitor;
	}

	public void setMonitor(String monitor) {
		this.monitor = monitor;
	}

	public String getOs() {
		return os;
	}

	public void setOs(String os) {
		this.os = os;
	}

	public String getCamera() {
		return camera;
	}

	public void setCamera(String camera) {
		this.camera = camera;
	}

	public String getFront_camera() {
		return front_camera;
	}

	public void setFront_camera(String front_camera) {
		this.front_camera = front_camera;
	}

	public String getCpu() {
		return cpu;
	}

	public void setCpu(String cpu) {
		this.cpu = cpu;
	}

	public String getRam() {
		return ram;
	}

	public void setRam(String ram) {
		this.ram = ram;
	}

	public String getRom() {
		return rom;
	}

	public void setRom(String rom) {
		this.rom = rom;
	}

	public String getSim() {
		return sim;
	}

	public void setSim(String sim) {
		this.sim = sim;
	}

	public String getPin() {
		return pin;
	}

	public void setPin(String pin) {
		this.pin = pin;
	}
	
}
