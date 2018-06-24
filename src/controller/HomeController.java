package controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.ProductDao;
import entity.Product;

@Controller
public class HomeController {
	@Autowired
	ProductDao product_dao;

	@RequestMapping(value="home")
	public String home(ModelMap md,@RequestParam(value="start",defaultValue="0")int start) {
		List<Product> list_All = product_dao.getAll();
		List<Product> lst_AllperPage= product_dao.getAllPerPage(start);
		md.addAttribute("lst_AllperPage", lst_AllperPage);
		int pageNumber = Math.round(list_All.size()/9);
		md.addAttribute("pageNumber",pageNumber );
		md.addAttribute("startIndex", start);
		md.addAttribute("active", "active");
		return "users/index";
	}
	
	@RequestMapping("product")
	public String iphone(ModelMap md,@RequestParam String producer) {
		List<Product> lstProduct= product_dao.getByProducerAsc(producer);
		md.addAttribute("lstProduct", lstProduct);
		md.addAttribute("producer", producer);
		return "users/product";
	}
	
	@RequestMapping("product-info")
	public String information(ModelMap md,@RequestParam("pId") String id) {
		Product product = product_dao.getProductByID(id);
		md.addAttribute("product", product);
		return "users/product-info";
	}
	
	@RequestMapping("cart")
	public String cart() {
		return "users/cart";
	}
	
	@RequestMapping("search")
	public String searchTest(ModelMap md, @RequestParam String textSearch) {
		List<Product> lstSearch = product_dao.getSearchByName(textSearch);
		md.addAttribute("lstSearch", lstSearch);
		return "users/search";
	}
	
	
	
	/*@RequestMapping(value="filter")
	public String filter(ModelMap md,@RequestParam String inputHidden ,@RequestParam String filterPrice) {
		String producer = inputHidden;
		if(filterPrice.equals("all")) {
			List<Product> lstProduct = product_dao.getByProducer(inputHidden);
			md.addAttribute("lstProduct", lstProduct);
		} else {
			long priceMin;
			long priceMax;
			if(filterPrice.equals("op1")) {
				priceMin = 0;
				priceMax = 1000000;
			} else if(filterPrice.equals("op2")) {
				priceMin = 1000000;
				priceMax = 2000000;
			} else if(filterPrice.equals("op3")) {
				priceMin = 2000000;
				priceMax = 5000000;
			} else if(filterPrice.equals("op4")) {
				priceMin = 5000000;
				priceMax = 10000000;
			} else {
				priceMin = 10000000;
				priceMax = 1000000000;
			}
			List<Product> lstProduct = product_dao.getFilterByPrice(inputHidden, priceMin, priceMax);
			md.addAttribute("lstProduct", lstProduct);
		}
		md.addAttribute("filterPrice", filterPrice);
		md.addAttribute("producer", producer);
		return "users/product";
	}*/
	
	// sort by price test
	@RequestMapping("sort-by-price")
	public String sort(ModelMap md, @RequestParam String inputHidden, @RequestParam String filterPrice, @RequestParam String sort) {
		String producer = inputHidden;
		if(filterPrice.equals("all")) {
			if(sort.equals("2")) {
				List<Product> lstProduct = product_dao.getByProducerDesc(inputHidden);
				md.addAttribute("lstProduct", lstProduct);
			} else {
				List<Product> lstProduct = product_dao.getByProducerAsc(inputHidden);
				md.addAttribute("lstProduct", lstProduct);
			}
		} else {
			long priceMin;
			long priceMax;
			if(filterPrice.equals("op1")) {
				priceMin = 0;
				priceMax = 1000000;
				if(sort.equals("2")) {
					List<Product> lstProduct = product_dao.getFilterByPriceDesc(inputHidden, priceMin, priceMax);
					md.addAttribute("lstProduct", lstProduct);
				} else {
					List<Product> lstProduct = product_dao.getFilterByPriceAsc(inputHidden, priceMin, priceMax);
					md.addAttribute("lstProduct", lstProduct);
				}
			} else if(filterPrice.equals("op2")) {
				priceMin = 1000000;
				priceMax = 2000000;
				if(sort.equals("2")) {
					List<Product> lstProduct = product_dao.getFilterByPriceDesc(inputHidden, priceMin, priceMax);
					md.addAttribute("lstProduct", lstProduct);
				} else {
					List<Product> lstProduct = product_dao.getFilterByPriceAsc(inputHidden, priceMin, priceMax);
					md.addAttribute("lstProduct", lstProduct);
				}
				
			} else if(filterPrice.equals("op3")) {
				priceMin = 2000000;
				priceMax = 5000000;
				if(sort.equals("2")) {
					List<Product> lstProduct = product_dao.getFilterByPriceDesc(inputHidden, priceMin, priceMax);
					md.addAttribute("lstProduct", lstProduct);
				} else {
					List<Product> lstProduct = product_dao.getFilterByPriceAsc(inputHidden, priceMin, priceMax);
					md.addAttribute("lstProduct", lstProduct);
				}
				
			} else if(filterPrice.equals("op4")) {
				priceMin = 5000000;
				priceMax = 10000000;
				if(sort.equals("2")) {
					List<Product> lstProduct = product_dao.getFilterByPriceDesc(inputHidden, priceMin, priceMax);
					md.addAttribute("lstProduct", lstProduct);
				} else {
					List<Product> lstProduct = product_dao.getFilterByPriceAsc(inputHidden, priceMin, priceMax);
					md.addAttribute("lstProduct", lstProduct);
				}
				
			} else {
				priceMin = 10000000;
				priceMax = 1000000000;
				if(sort.equals("2")) {
					List<Product> lstProduct = product_dao.getFilterByPriceDesc(inputHidden, priceMin, priceMax);
					md.addAttribute("lstProduct", lstProduct);
				} else {
					List<Product> lstProduct = product_dao.getFilterByPriceAsc(inputHidden, priceMin, priceMax);
					md.addAttribute("lstProduct", lstProduct);
				}
			}
		}
		md.addAttribute("filterPrice", filterPrice);
		md.addAttribute("sort", sort);
		md.addAttribute("producer", producer);
		return "users/product";
	}
}
