package dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import entity.ProductColors;

@Component
public class ProductColorDao {

	@Autowired
	SessionFactory factory;

	@Transactional
	public ProductColors getProductColor(String productId, String color) {
		Session session = factory.getCurrentSession();
		String hql = "from ProductColors where product_id =:productId and color =:color";
		Query query = session.createQuery(hql);
		query.setParameter("productId", productId);
		query.setParameter("color", color);
		ProductColors productColor = (ProductColors) query.uniqueResult();
		return productColor;
	}
	
	@Transactional
	public ProductColors getProductColorByID(String productId) {
		Session session = factory.getCurrentSession();
		String hql = "from ProductColors where product_id =:productId";
		Query query = session.createQuery(hql);
		query.setParameter("productId", productId);
		ProductColors productColor = (ProductColors) query.uniqueResult();
		return productColor;
	}

	@Transactional
	public List<ProductColors> getAllProduct() {
		Session session = factory.getCurrentSession();
		String hql = "from ProductColors";
		Query query = session.createQuery(hql);
		List<ProductColors> listProduct = query.list();
		return listProduct;
	}


	public boolean insertProductColor(ProductColors product) {
		Session session = factory.openSession();
		Transaction tr = session.beginTransaction();
		try {
			session.save(product);
			tr.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			tr.rollback();
			return false;
		} finally {
			session.close();
		}
	}
	public boolean updateProductColor(ProductColors product) {
		Session session = factory.openSession();
		Transaction tr = session.beginTransaction();
		try {
			session.update(product);
			tr.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			tr.rollback();
			return false;
		} finally {
			session.close();
		}
	}

	public boolean deleteProductColor(ProductColors product) {
		Session session = factory.openSession();
		Transaction tr = session.beginTransaction();
		try {
			session.delete(product);
			tr.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			tr.rollback();
			return false;
		} finally {
			session.close();
		}
	}
}
