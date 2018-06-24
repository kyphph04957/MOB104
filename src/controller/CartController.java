package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import dao.CartDao;
import dao.ProductColorDao;
import dao.ProductDao;
import dao.PurchaseDao;
import dao.PurchaseItemDao;
import entity.Cart;
import entity.ProductColors;
import entity.Purchase;
import entity.PurchaseItem;
import entity.Users;

@Controller
public class CartController {
	@Autowired
	ProductDao productDao;
	@Autowired
	ProductColorDao productColorDao;
	@Autowired
	CartDao cartDao;
	@Autowired
	PurchaseDao purchaseDao;
	@Autowired
	PurchaseItemDao PurchaseItemDao;

	@RequestMapping("add-to-cart")
	public String addToCart(HttpSession session, ModelMap md, @RequestParam String pID, HttpServletRequest request,
			@RequestParam String color) {
		session = request.getSession(true);
		cartDao = (CartDao) session.getAttribute("shop");
		ProductColors productColor = productColorDao.getProductColor(pID, color);
		if (cartDao == null) {
			cartDao = new CartDao();
		}
		cartDao.addToCart(new Cart(pID, productColor, color), color);
		session.setAttribute("shop", cartDao);
		session.setAttribute("total", cartDao.getTotalPrice());
		return "users/cart";

	}

	@RequestMapping("remove-to-cart")
	public String removeToCart(@RequestParam String pID, @RequestParam String color, HttpSession session) {
		cartDao.removeToCart(pID, color);
		return "users/cart";
	}

	@RequestMapping("order")
	public String order(ModelMap md) {
		md.addAttribute("total", cartDao.getTotalPrice());
		return "users/order";
	}

	@RequestMapping("pay")
	public String pay(HttpSession session, HttpServletRequest request, @RequestParam String clientAddress,
			@RequestParam String clientPhone) {
		session = request.getSession();
		Users user = (Users) session.getAttribute("user");
		CartDao cart = (CartDao) session.getAttribute("shop");
		Purchase purchase = new Purchase(user, clientAddress, clientPhone, "Đang xử lý");
		purchaseDao.insertPurchase(purchase);
		boolean kq = false;
		for (String x : cart.keySet()) {
			kq = PurchaseItemDao.insertPurchaseItem(new PurchaseItem(purchase, cart.get(x).getProductColor(),
					cart.get(x).getQuantity(), cart.get(x).getProductColor().getProduct().getPrice()));
		}
		if(kq==true) {
			session.removeAttribute("shop");
			return "redirect:/home.htm";
		}else {
			return "redirect:/cart.htm";
		}

		
	}
}
