package dao;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import entity.Users;

@Component
public class UsersDao {
	@Autowired
	@Qualifier("sessionFactory")
	SessionFactory factory;

	public UsersDao() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	@Transactional
	public Users getUSER(String username){
		Session session = factory.getCurrentSession();
		String hql = "from Users where username =:username";
		Query query =  session.createQuery(hql);
		query.setParameter("username", username);
		Users usr = (Users) query.uniqueResult();
		return usr;
	}
	
	public void insertUser(Users user) {
		Session  session = factory.openSession();
		Transaction tr = session.beginTransaction();
		try {
			session.save(user);
			tr.commit();			
		} catch (Exception e) {
			tr.rollback();
			e.printStackTrace();
		}finally {
			session.close();
		}
	}
}
