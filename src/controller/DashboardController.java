package controller;

import java.io.File;

import javax.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import dao.ProductColorDao;
import dao.ProductDao;
import dao.PurchaseDao;
import dao.PurchaseItemDao;
import entity.Product;
import entity.ProductColors;
import entity.Purchase;

@Controller
@RequestMapping("/admin/")
public class DashboardController {
	@Autowired
	PurchaseDao purchaseDao;

	@Autowired
	PurchaseItemDao purchaseItemDao;

	@Autowired
	ProductColorDao productColorDao;

	@Autowired
	ProductDao productDao;

	@Autowired
	ServletContext context;

	@RequestMapping("dashboard/order-management")
	public String orderManagement(ModelMap md) {
		md.addAttribute("orderList", purchaseDao.getAllPurchase());
		return "admin/dashboard/order-management";
	}

	@RequestMapping("dashboard/product-management")
	public String productManagement(ModelMap md) {
		md.addAttribute("productList", productColorDao.getAllProduct());
		md.addAttribute("totalProduct", productDao.getAmountProduct());
		return "admin/dashboard/product-management";
	}

	@RequestMapping(value = "/insert-product", method = RequestMethod.GET)
	public String insertPage() {
		return "admin/dashboard/insert-product";
	}

	@RequestMapping("insertProduct")
	public String insertProduct(ModelMap md, @RequestParam String productID, @RequestParam String productName,
			@RequestParam long productPrice, @RequestParam String brandList, @RequestParam int productAmount,
			@RequestParam String colorList, @RequestParam String productMonitor, @RequestParam String productOS,
			@RequestParam String productCamera, @RequestParam String productFrontCamera,
			@RequestParam String productCPU, @RequestParam String productRAM, @RequestParam String productROM,
			@RequestParam String productSIM, @RequestParam String productPIN,
			@RequestParam(value = "productDescription", defaultValue = "", required = false) String productDescription,
			@RequestParam MultipartFile productFrontImg, @RequestParam MultipartFile productBehindImg,
			@RequestParam MultipartFile productThicknessImg) {
		if (!(productFrontImg.isEmpty() || productBehindImg.isEmpty() || productThicknessImg.isEmpty())) {
			try {
				String productFrontImgPath = context.getRealPath("/images/" + productFrontImg.getOriginalFilename());
				productFrontImg.transferTo(new File(productFrontImgPath));
				String productBehindImgPath = context.getRealPath("/images/" + productBehindImg.getOriginalFilename());
				productBehindImg.transferTo(new File(productBehindImgPath));
				String productThicknessImgPath = context
						.getRealPath("/images/" + productThicknessImg.getOriginalFilename());
				productThicknessImg.transferTo(new File(productThicknessImgPath));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		Product product = productDao.getProductByID(productID);
		if (product == null) {
			product = new Product(productID, productName, productPrice, brandList, productAmount, productMonitor,
					productOS, productCamera, productFrontCamera, productCPU, productRAM, productROM, productSIM,
					productPIN, productDescription);
			productDao.insertProduct(product);
		} else {
			product = productDao.getProductByID(productID);
			product.setAmount(product.getAmount() + productAmount);
			productDao.updateProduct(product);
		}
		ProductColors productColors = productColorDao.getProductColor(productID, colorList);
		boolean kq = false;
		if (productColors == null) {
			productColors = new ProductColors(product, colorList, productFrontImg.getOriginalFilename(),
					productBehindImg.getOriginalFilename(), productThicknessImg.getOriginalFilename());
			kq = productColorDao.insertProductColor(productColors);
		} else {
			md.addAttribute("insertError", "Sản phẩm đã tồn tại!");
			return "admin/dashboard/insert-product";
		}
		if (kq == true) {
			return "redirect:/admin/dashboard/product-management.htm";
		} else {
			return "admin/dashboard/insert-product";
		}

	}

	@RequestMapping("edit-product")
	public String editProduct(ModelMap md, @RequestParam String pID, @RequestParam String color) {
		ProductColors product = productColorDao.getProductColor(pID, color);
		md.addAttribute("editProduct", product);
		return "admin/dashboard/edit-product";
	}

	@RequestMapping("update-product")
	public String updateProduct(@RequestParam String productID, @RequestParam String productName,
			@RequestParam long productPrice, @RequestParam String brandList, @RequestParam int productAmount,
			@RequestParam String colorList, @RequestParam String productMonitor, @RequestParam String productOS,
			@RequestParam String productCamera, @RequestParam String productFrontCamera,
			@RequestParam String productCPU, @RequestParam String productRAM, @RequestParam String productROM,
			@RequestParam String productSIM, @RequestParam String productPIN,
			@RequestParam(value = "productDescription", defaultValue = "", required = false) String productDescription,
			@RequestParam MultipartFile productFrontImg, @RequestParam MultipartFile productBehindImg,
			@RequestParam MultipartFile productThicknessImg) {
		if (!(productFrontImg.isEmpty() || productBehindImg.isEmpty() || productThicknessImg.isEmpty())) {
			try {
				String productFrontImgPath = context.getRealPath("/images/" + productFrontImg.getOriginalFilename());
				productFrontImg.transferTo(new File(productFrontImgPath));
				String productBehindImgPath = context.getRealPath("/images/" + productBehindImg.getOriginalFilename());
				productBehindImg.transferTo(new File(productBehindImgPath));
				String productThicknessImgPath = context
						.getRealPath("/images/" + productThicknessImg.getOriginalFilename());
				productThicknessImg.transferTo(new File(productThicknessImgPath));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		Product product = productDao.getProductByID(productID);
		if (product != null) {
			product.setName(productName);
			product.setPrice(productPrice);
			product.setProducer(brandList);
			product.setAmount(productAmount);
			product.setCamera(productCamera);
			product.setFront_camera(productFrontCamera);
			product.setMonitor(productMonitor);
			product.setCpu(productCPU);
			product.setRam(productRAM);
			product.setRom(productROM);
			product.setSim(productSIM);
			product.setPin(productPIN);
			product.setDescription(productDescription);
			productDao.updateProduct(product);

		}
		ProductColors productColors = productColorDao.getProductColor(productID, colorList);
		boolean kq = false;
		if (productColors != null) {
			productColors.setColor(colorList);
			productColors.setProduct(product);
			if (!(productFrontImg.getOriginalFilename().isEmpty())) {
				productColors.setImg_front(productFrontImg.getOriginalFilename());
			}
			if (!(productBehindImg.getOriginalFilename().isEmpty())) {
				productColors.setImg_behind(productBehindImg.getOriginalFilename());
			}
			if (!(productThicknessImg.getOriginalFilename().isEmpty())) {
				productColors.setImg_thickness(productThicknessImg.getOriginalFilename());
			}
			kq = productColorDao.updateProductColor(productColors);
		}

		if (kq == true) {
			return "redirect:/admin/dashboard/product-management.htm";
		} else {
			return "admin/dashboard/insert-product";
		}

	}

	@RequestMapping("update-order")
	public String updateOrder(ModelMap md, @RequestParam String purID) {
		int purchaseID = Integer.parseInt(purID);
		md.addAttribute("purItemList", purchaseItemDao.getPurchaseItem(purchaseID));
		Purchase purchase = purchaseDao.getPurchasebyId(purchaseID);
		String status = purchase.getStatus();
		md.addAttribute("status", status);
		md.addAttribute("purID", purID);
		return "admin/dashboard/update-order";
	}

	@RequestMapping(value = "update-status", method = RequestMethod.POST)
	public String updateStatus(@RequestParam String purID, @RequestParam String statusList) {
		int id = Integer.parseInt(purID);
		Purchase purchase = purchaseDao.getPurchasebyId(id);
		String status;
		if (statusList.equals("1")) {
			status = "Đang xử lý";
		} else if (statusList.equals("2")) {
			status = "Đang vận chuyển";
		} else {
			status = "Đã giao hàng";
		}
		purchase.setStatus(status);
		purchaseDao.updatePurchase(purchase);
		return "redirect:/admin/dashboard/order-management.htm";
	}

	@RequestMapping("delete-product")
	public String deleteProduct(ModelMap md, @RequestParam String pID, @RequestParam String color) {
		ProductColors productColor = productColorDao.getProductColor(pID, color);
		System.out.println("===================================");
		try {
			boolean kq= false;
			if (productColor != null) {
				System.out.println(productColor.getId());
				kq= productColorDao.deleteProductColor(productColor);
				if(kq==true) {
					return "redirect:/admin/dashboard/product-management.htm";
				}else {
					return "redirect:/home.htm";
				}
			}else {
				System.out.println("null here");
				return "redirect:/admin/dashboard/order-management.htm";
			}
		} catch (Exception e) {
			e.printStackTrace();
			md.addAttribute("deleteError", "Không thể xóa sản phẩm này!");
			return "";
		}
	}

}
