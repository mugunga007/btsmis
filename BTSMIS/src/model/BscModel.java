 package model;

import hibernateUtility.HibernateUtil;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import service.Bsc;
import service.Bts;
import service.ItemCategory;
import service.Region;

public class BscModel{
	
	
public boolean registerBsc(Bsc b){
		
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

public boolean deleteBsc(Bsc b){
	
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



public List<Region> getAllRegions(){
	List<Region> list = new ArrayList<>();
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	try{
		
		tx = session.getTransaction();
		tx.begin();
	list = session.createQuery("from Region ").list();

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


public List<Bsc> getAllBsc(){
	List<Bsc> list = new ArrayList<>();
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	try{
		
		tx = session.getTransaction();
		tx.begin();
	list = session.createQuery("from Bsc ").list();

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


public Bsc getBsc(String id){
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	
	Bsc r = new Bsc();
	Criteria cr;
	
	try{
		
		tx = session.getTransaction();
		tx.begin();
		cr = session.createCriteria(Bsc.class);
		
		 cr.add(Restrictions.eq("bscId", id));
		
		r =  (Bsc) cr.uniqueResult();

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

public List<Bsc> getBscByEngineer(int id){
	List<Bsc> list = new ArrayList<>();
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

	
}
