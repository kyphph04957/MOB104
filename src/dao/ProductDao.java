package dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import entity.Product;

@Component
public class ProductDao {

	@Autowired
	SessionFactory factory;

	@Transactional
	public List<Product> getAll() {
		Session session = factory.getCurrentSession();
		String hql = "from Product";
		Query query = session.createQuery(hql);
		List<Product> list_Allproduct = query.list();
		return list_Allproduct;
	}

	@Transactional
	public List<Product> getByProducerAsc(String producer) {
		Session session = factory.getCurrentSession();
		String hql = "from Product where producer=:producer order by price asc";
		Query query = session.createQuery(hql);
		query.setParameter("producer", producer);
		List<Product> list_product = query.list();
		return list_product;
	}

	@Transactional
	public List<Product> getByProducerDesc(String producer) {
		Session session = factory.getCurrentSession();
		String hql = "from Product where producer=:producer order by price desc";
		Query query = session.createQuery(hql);
		query.setParameter("producer", producer);
		List<Product> list_product = query.list();
		return list_product;
	}

	@Transactional
	public List<Product> getAllPerPage(int start) {
		Session session = factory.getCurrentSession();
		String hql = "from Product";
		Query query = session.createQuery(hql);
		query.setFirstResult(start);
		query.setMaxResults(9);
		List<Product> list_product = query.list();
		return list_product;
	}

	@Transactional
	public List<Product> getProducerPerPage(int start, String producer) {
		Session session = factory.getCurrentSession();
		String hql = "from Product where producer=:producer";
		Query query = session.createQuery(hql);
		query.setParameter("producer", producer);
		query.setFirstResult(start);
		query.setMaxResults(9);
		List<Product> list_product = query.list();
		return list_product;
	}

	@Transactional
	public Product getProductByID(String id) {
		Session session = factory.getCurrentSession();
		String hql = "from Product where id=:id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		Product product = (Product) query.uniqueResult();
		return product;
	}

	@Transactional
	public List<Product> getSearchByName(String textSearch) {
		Session session = factory.getCurrentSession();
		String hql = "from Product where name like :textSearch or producer like :textSearch";
		Query query = session.createQuery(hql);
		query.setParameter("textSearch", "%" + textSearch + "%");
		List<Product> list_product = query.list();
		return list_product;
	}

	@Transactional
	public List<Product> getFilterByPriceAsc(String producer, long priceMin, long priceMax) {
		Session session = factory.getCurrentSession();
		String hql = "from Product where producer=:producer and price >= :priceMin and price <= :priceMax order by price asc";
		Query query = session.createQuery(hql);
		query.setParameter("producer", producer);
		query.setParameter("priceMin", priceMin);
		query.setParameter("priceMax", priceMax);
		List<Product> list_product = query.list();
		return list_product;
	}

	@Transactional
	public List<Product> getFilterByPriceDesc(String producer, long priceMin, long priceMax) {
		Session session = factory.getCurrentSession();
		String hql = "from Product where producer=:producer and price >= :priceMin and price <= :priceMax order by price desc";
		Query query = session.createQuery(hql);
		query.setParameter("producer", producer);
		query.setParameter("priceMin", priceMin);
		query.setParameter("priceMax", priceMax);
		List<Product> list_product = query.list();
		return list_product;
	}

	public void insertProduct(Product product) {
		Session session = factory.openSession();
		Transaction tr = session.beginTransaction();
		try {
			session.save(product);
			tr.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tr.rollback();

		} finally {
			session.close();
		}
	}
	
	public void updateProduct(Product product) {
		Session session = factory.openSession();
		Transaction tr = session.beginTransaction();
		try {
			session.update(product);
			tr.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tr.rollback();

		} finally {
			session.close();
		}
	}

	public boolean deleteProduct(Product product) {
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
	
	@Transactional
	public int getAmountProduct() {
		Session session = factory.getCurrentSession();
		String hql = "select sum(amount) from Product";
		Query query = session.createQuery(hql);
		int total = Integer.parseInt(query.uniqueResult() + "");
		return total;
	}


	// test sort
	/*
	 * @Transactional public List<Product> getByProducer(String producer, String
	 * sort) { Session session = factory.getCurrentSession(); String hql =
	 * "from Product where producer=:producer order by price :sort"; Query query =
	 * session.createQuery(hql); query.setParameter("producer", producer);
	 * query.setParameter("sort", sort); List<Product> list_product = query.list();
	 * return list_product; }
	 * 
	 * @Transactional public List<Product> getFilterByPrice(String producer, long
	 * priceMin, long priceMax, String sort) { Session session =
	 * factory.getCurrentSession(); String hql =
	 * "from Product where producer=:producer and price >= :priceMin and price <= :priceMax order by price :sort"
	 * ; Query query = session.createQuery(hql); query.setParameter("producer",
	 * producer); query.setParameter("priceMin", priceMin);
	 * query.setParameter("priceMax", priceMax); query.setParameter("sort", sort);
	 * List<Product> list_product = query.list(); return list_product; }
	 */
}
