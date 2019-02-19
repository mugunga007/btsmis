package model;

import hibernateUtility.HibernateUtil;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import service.GenFuelTracking;
import service.GenSet;
import service.ItemUsage;
import service.Request;

public class GenFuelTrackingModel {

	
public boolean registerGenFuelTracking(GenFuelTracking p){
		
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

	
public List<GenFuelTracking> getGenFuelTrackingByGen(String genSetId,String userId){
	List<GenFuelTracking> list = new ArrayList<>();
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	Criteria cr = null;
	try{
		
		tx = session.getTransaction();
		tx.begin();
		cr = session.createCriteria(GenFuelTracking.class);
		cr.add(Restrictions.eq("genSetId", genSetId));
		cr.add(Restrictions.eq("userId", userId));
	list = session.createQuery("from GenFuelTracking").list();
//list = cr.list();
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

public List<GenFuelTracking> getDetailedGenFuelTrackingList(int itemId){
	List<GenFuelTracking> list = new ArrayList<>();
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	//Request pro = new Request();
	Criteria cr;
	
	try{
		
		tx = session.getTransaction();
		tx.begin();
		cr = session.createCriteria(GenFuelTracking.class);
		
		 cr.add(Restrictions.eq("itemId", itemId));
		 cr.add(Restrictions.eq("status", "Request"));
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


public List<GenFuelTracking> getGenFuelTrackingList(String genSetId){
	List<GenFuelTracking> list = new ArrayList<>();
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	//Request pro = new Request();
	Criteria cr;
	
	try{
		
		tx = session.getTransaction();
		tx.begin();
		cr = session.createCriteria(GenFuelTracking.class);
		
		 cr.add(Restrictions.eq("genSetId", genSetId));
		 
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



public GenFuelTracking getLatestGenFuelTrackingRunHours(int userId, String genSetId){
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	
	GenFuelTracking  r = new GenFuelTracking();
	Criteria cr;
	
	try{
		
		tx = session.getTransaction();
		tx.begin();
		cr = session.createCriteria(GenFuelTracking.class);
		
		// cr.add(Restrictions.eq("requestId", requestId));
		cr.add(Restrictions.eq("userId", userId));
		cr.add(Restrictions.eq("genSetId", genSetId));
		cr.add(Restrictions.eq("action", "Remaining"));
		cr.addOrder(Order.desc("genFuelTrackingId"));
		
		cr.setMaxResults(1);
		r =  (GenFuelTracking) cr.uniqueResult();

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


public GenFuelTracking getLatestGenFuelTrackingCurrent(int userId, String genSetId){
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	
	GenFuelTracking  r = new GenFuelTracking();
	Criteria cr;
	
	try{
		
		tx = session.getTransaction();
		tx.begin();
		cr = session.createCriteria(GenFuelTracking.class);
		
		// cr.add(Restrictions.eq("requestId", requestId));
		cr.add(Restrictions.eq("userId", userId));
		cr.add(Restrictions.eq("genSetId", genSetId));
		//cr.add(Restrictions.eq("action", "Remaining"));
		cr.addOrder(Order.desc("genFuelTrackingId"));
		
		cr.setMaxResults(1);
		r =  (GenFuelTracking) cr.uniqueResult();

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


public boolean updateHours(String GenFuelTrackingId, double hours){
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	GenFuelTracking r = (GenFuelTracking)session.get(GenFuelTracking.class, GenFuelTrackingId);	
	try{
		tx = session.getTransaction();
		tx.begin();
r.setHours(hours);
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



public GenFuelTracking getGenFuelTracking(){
//	List<ItemUsage> list = new ArrayList<>();
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	GenFuelTracking gf = new GenFuelTracking();
	try{
		
		tx = session.getTransaction();
		tx.begin();
		//cr = session.createCriteria(Request.class);
		//cr.add(Restrictions.eq("status", "Request"));
	gf = (GenFuelTracking) session.createQuery("from GenFuelTracking ").uniqueResult();
//list = cr.list();
	tx.commit();
	}catch(Exception e){
		if(tx!=null)
			tx.rollback();
		e.printStackTrace();
	}finally{
		session.close();
	}
	return gf;
}


public List<GenFuelTracking> checkRemainingAction(String userId){
	String r = "Remaining";
	List<GenFuelTracking> list = new ArrayList<>();
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	Criteria cr = null;
	try{
		
		tx = session.getTransaction();
		tx.begin();
		cr = session.createCriteria(GenFuelTracking.class);
		cr.add(Restrictions.eq("action", r));
		cr.add(Restrictions.eq("userId", userId));
	//list = session.createQuery("from GenFuelTracking").list();
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
