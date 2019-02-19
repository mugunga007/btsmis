package model;

import java.util.ArrayList;
import java.util.List;

import hibernateUtility.HibernateUtil;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import service.Bts;
import service.FieldEngineer;
import service.InStock;
import service.Region;
import service.User;

public class UserModel {

public boolean registerUser(User p){
		
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		
		try{
			tx = session.getTransaction();
			tx.begin();
			session.saveOrUpdate(p);
			tx.commit();
		}catch(Exception e){
			if(tx!=null)
				tx.rollback();
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return true;
	}

	
	public User userLogin(String username, String password){
		Session session = HibernateUtil.openSession();
		Transaction tr = null;
		User user =null;
		try{
			tr = session.getTransaction();
			tr.begin();
			Query q =session.createQuery("from User where username ='"+username+"' and password = '"+password+"'");
			user =(User)q.uniqueResult();
			tr.commit();
		}catch(Exception e){
			if(tr!=null)
				tr.rollback();
			e.printStackTrace();
		}finally{
			session.close();
		}
		return user;
	}
	
	
	public User getUser(int id){
		Session session = HibernateUtil.openSession();
		Transaction tr = null;
		User user =null;
		try{
			tr = session.getTransaction();
			tr.begin();
			Query q =session.createQuery("from User where id ='"+id+"'"); 
			user =(User)q.uniqueResult();
			tr.commit();
		}catch(Exception e){
			if(tr!=null)
				tr.rollback();
			e.printStackTrace();
		}finally{
			session.close();
		}
		return user;
	}
	
	public List<User> getUserByRole(String role){
		List<User> list = new ArrayList<>();
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		//Request pro = new Request();
		Criteria cr;
		
		try{
			
			tx = session.getTransaction();
			tx.begin();
			cr = session.createCriteria(User.class);
			
			 cr.add(Restrictions.eq("role", role));
			//cr.add(Restrictions.eq("price", price));
		//	cr.add(Restrictions.between("price", 0.0, price));
	list = cr.list();
		tx.commit();
		}catch(Exception e){
			if(tx!=null)
				tx.rollback();
			e.printStackTrace();
		}finally{
			session.close();
		}
		return list;
	}

	public List<User> getFieldEngineerByRegion(int id){
		List<User> list = new ArrayList<>();
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		//Request pro = new Request();
		Criteria cr;
		
		try{
			
			tx = session.getTransaction();
			tx.begin();
			cr = session.createCriteria(User.class);
			
			 cr.add(Restrictions.eq("region", id));
			 cr.add(Restrictions.eq("role", "Field Engineer"));
			//cr.add(Restrictions.eq("price", price));
		//	cr.add(Restrictions.between("price", 0.0, price));
	list = cr.list();
		tx.commit();
		}catch(Exception e){
			if(tx!=null)
				tx.rollback();
			e.printStackTrace();
		}finally{
			session.close();
		}
		return list;
	}

	
	
	
	public User getRegionManagerByRegion( int regionId){
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		
		User r = new User();
		Criteria cr;
		
		try{
			
			tx = session.getTransaction();
			tx.begin();
			cr = session.createCriteria(User.class);
			cr.add(Restrictions.eq("role", "Region Manager"));
			 cr.add(Restrictions.eq("region", regionId));
			
			r =  (User) cr.uniqueResult();

		tx.commit();
		}catch(Exception e){
			if(tx!=null)
				tx.rollback();
			e.printStackTrace();
		}finally{
			session.close();
		}
		return r;
	}
	
	
	public User getOperationsManager( ){
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		
		User r = new User();
		Criteria cr;
		
		try{
			
			tx = session.getTransaction();
			tx.begin();
			cr = session.createCriteria(User.class);
			cr.add(Restrictions.eq("role", "Operations Manager"));
			
			r =  (User) cr.uniqueResult();

		tx.commit();
		}catch(Exception e){
			if(tx!=null)
				tx.rollback();
			e.printStackTrace();
		}finally{
			session.close();
		}
		return r;
	}

	public User getStoreKeeper( ){
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		
		User r = new User();
		Criteria cr;
		
		try{
			
			tx = session.getTransaction();
			tx.begin();
			cr = session.createCriteria(User.class);
			cr.add(Restrictions.eq("role", "Store Keeper"));
			
			r =  (User) cr.uniqueResult();

		tx.commit();
		}catch(Exception e){
			if(tx!=null)
				tx.rollback();
			e.printStackTrace();
		}finally{
			session.close();
		}
		return r;
	}

	
}
