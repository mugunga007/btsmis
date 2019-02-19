package model;

import java.util.ArrayList;
import java.util.List;

import hibernateUtility.HibernateUtil;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import service.Bts;
import service.ItemController;
import service.ItemUsage;
import service.Request;

public class ItemUsageModel {

	

public boolean createItemUsage(ItemUsage p){
		
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

public List<ItemUsage> getUserItemUsageItem(int userId, int itemId){
	List<ItemUsage> list = new ArrayList<>();
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	//Request pro = new Request();
	Criteria cr;
	
	try{
		
		tx = session.getTransaction();
		tx.begin();
		cr = session.createCriteria(ItemUsage.class);
		
		 cr.add(Restrictions.eq("userId", userId));
		 cr.add(Restrictions.eq("itemId", itemId));
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

public List<ItemUsage> getItemUsagetList(){
	List<ItemUsage> list = new ArrayList<>();
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	Criteria cr = null;
	try{
		
		tx = session.getTransaction();
		tx.begin();
		//cr = session.createCriteria(Request.class);
		//cr.add(Restrictions.eq("status", "Request"));
	list = session.createQuery("from ItemUsage ").list();
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


public List<ItemUsage> getGenSetFuelTracking(int userId, int itemId, String btsId){
	List<ItemUsage> list = new ArrayList<>();
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	//Request pro = new Request();
	Criteria cr;
	
	try{
		
		tx = session.getTransaction();
		tx.begin();
		cr = session.createCriteria(ItemUsage.class);
		
		 cr.add(Restrictions.eq("userId", userId));
		 cr.add(Restrictions.eq("itemId", itemId));
		 cr.add(Restrictions.eq("btsId", btsId));
		 
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


public List<ItemUsage> getGenSetFuelTrackingRegion( int itemId, String btsId){
	List<ItemUsage> list = new ArrayList<>();
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	//Request pro = new Request();
	Criteria cr;
	
	try{
		
		tx = session.getTransaction();
		tx.begin();
		cr = session.createCriteria(ItemUsage.class);
		
		 cr.add(Restrictions.eq("itemId", itemId));
		 cr.add(Restrictions.eq("btsId", btsId));
		 
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



public boolean updateAttachment(int usageId, String attachment){
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	ItemUsage r = (ItemUsage)session.get(ItemUsage.class, usageId);	
	try{
		tx = session.getTransaction();
		tx.begin();

		r.setAttachment(attachment);
	
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
