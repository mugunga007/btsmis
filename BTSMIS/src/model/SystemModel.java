package model;

import hibernateUtility.HibernateUtil;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import service.System;

public class SystemModel {

public boolean registerSystem(System p){
		
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


public boolean deleteSystem(System p){
	
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



public List<System> getSystemList(){
	List<System> list = new ArrayList<>();
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	Criteria cr = null;
	try{
		
		tx = session.getTransaction();
		tx.begin();
	list = session.createQuery("from System ").list();
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

public System getSystem(int id){
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	
System r = new System();  
	Criteria cr;
	
	try{
		
		tx = session.getTransaction();
		tx.begin();
		cr = session.createCriteria(System.class);
		
		 cr.add(Restrictions.eq("id", id));
		
		r =  (System) cr.uniqueResult();

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
