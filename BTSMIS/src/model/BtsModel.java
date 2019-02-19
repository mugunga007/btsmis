 package model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import hibernateUtility.HibernateUtil;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import service.Bts;
import service.GenSet;
import service.Item;
import service.Request;
import service.SitesClass;

public class BtsModel{
	
	
public boolean registerBts(Bts b){
		
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		
		try{
			tx = session.getTransaction();
			tx.begin();
			session.saveOrUpdate(b);
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

public boolean deleteBts(Bts b){
	
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	
	try{
		tx = session.getTransaction();
		tx.begin();
		session.delete(b);
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


public List<Bts> getAllBts(){
	List<Bts> list = new ArrayList<>();
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	try{
		
		tx = session.getTransaction();
		tx.begin();
	list = session.createQuery("from Bts ").list();

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

public Bts getBts(String id){
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	
	Bts r = new Bts();
	Criteria cr;
	
	try{
		
		tx = session.getTransaction();
		tx.begin();
		cr = session.createCriteria(Bts.class);
		
		 cr.add(Restrictions.eq("btsId", id));
		
		r =  (Bts) cr.uniqueResult();

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



public List<Bts> getBtsByEngineer(int id){
	List<Bts> list = new ArrayList<>();
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	//Request pro = new Request();
	Criteria cr;
	
	try{
		
		tx = session.getTransaction();
		tx.begin();
		cr = session.createCriteria(Bts.class);
		
		 cr.add(Restrictions.eq("engineerId", id));
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

public List<Bts> getBtsByRegion(int id){
	List<Bts> list = new ArrayList<>();
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	//Request pro = new Request();
	Criteria cr;
	
	try{
		
		tx = session.getTransaction();
		tx.begin();
		cr = session.createCriteria(Bts.class);
		
		 cr.add(Restrictions.eq("regionId", id));
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

public boolean updateBtsEngineer(String id,int engId){
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	 Bts r = (Bts)session.get(Bts.class, id);	
	try{
		tx = session.getTransaction();
		tx.begin();

	r.setEngineerId(engId);
	r.setStatus("Engineer Updated");
	//pro.setStatus("released");
		session.update(r);
		tx.commit();
	}
		catch(Exception e){
			if(tx!=null)
				tx.rollback();
			e.printStackTrace();
		}finally {
			session.close();
	}
	return true;
}



}
