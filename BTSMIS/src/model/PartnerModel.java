package model;

import hibernateUtility.HibernateUtil;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import service.Partner;

public class PartnerModel {

public boolean registerPatner(Partner p){
		
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

	
public boolean deletePatner(Partner p){
	
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	
	try{
		tx = session.getTransaction();
		tx.begin();
		session.delete(p);
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

public List<Partner> getPatnerList(){
	List<Partner> list = new ArrayList<>();
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	Criteria cr = null;
	try{
		
		tx = session.getTransaction();
		tx.begin();
	list = session.createQuery("from Partner").list();
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


public Partner getPatner(int id){
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	
	Partner r = new Partner(); 
	Criteria cr;
	
	try{
		
		tx = session.getTransaction();
		tx.begin();
		cr = session.createCriteria(Partner.class);
		
		 cr.add(Restrictions.eq("partnerId", id));
		
		r =  (Partner) cr.uniqueResult();

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
