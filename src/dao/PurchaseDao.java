package dao;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import entity.Purchase;

@Component
public class PurchaseDao {

	@Autowired
	SessionFactory factory;

	@Transactional
	public List<Purchase> getAllPurchase() {
		Session session = factory.getCurrentSession();
		String hql = "from Purchase";
		Query query = session.createQuery(hql);
		List<Purchase> purchases = query.list();
		return purchases;
	}

	@Transactional
	public Purchase getPurchasebyId(int id) {
		Session session = factory.getCurrentSession();
		String hql = "from Purchase where id = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		Purchase purchase = (Purchase) query.uniqueResult();
		return purchase;
	}

	public void insertPurchase(Purchase purchase) {
		Session session = factory.openSession();
		Transaction tr = session.beginTransaction();
		try {
			session.save(purchase);
			tr.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	public void updatePurchase(Purchase purchase) {
		Session session = factory.openSession();
		Transaction tr = session.beginTransaction();
		try {
			session.update(purchase);
			tr.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tr.rollback();

		} finally {
			session.close();
		}
	}
}
