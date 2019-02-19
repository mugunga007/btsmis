package model;

import java.util.ArrayList;
import java.util.List;

import hibernateUtility.HibernateUtil;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import service.Item;
import service.ItemController;
import service.Request;

public class ItemControllerModel {

public boolean createItemController(ItemController p){
		
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


public ItemController getItemController(int itemControllerId){
//	List<InStock> list = new ArrayList<>();
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	Criteria cr;
	ItemController it = new ItemController();
	try{
		
		tx = session.getTransaction();
		tx.begin();
		Query query= session.createQuery("from ItemController where  itemControllerId="+itemControllerId);
		it = (ItemController) query.uniqueResult();
	tx.commit();
	}catch(Exception e){
		if(tx!=null)
			tx.rollback();
		e.printStackTrace();
	}finally{
		session.close();
	}
	return it;
}



public List<ItemController> getUserItemController(int userId){
	List<ItemController> list = new ArrayList<>();
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	//Request pro = new Request();
	Criteria cr;
	
	try{
		
		tx = session.getTransaction();
		tx.begin();
		cr = session.createCriteria(ItemController.class);
		
		 cr.add(Restrictions.eq("userId", userId));
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



public boolean updateItemControllerQuantity(int itemControllerId, int quantity){
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	ItemController r = (ItemController)session.get(ItemController.class, itemControllerId);	
	try{
		tx = session.getTransaction();
		tx.begin();

	r.setQuantity(quantity);
	//r.setDeliveredQuantity(deliveredQuantity);
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

public ItemController getItemController(int itemId, int userId){
//	List<InStock> list = new ArrayList<>();
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	Criteria cr;
	ItemController it = new ItemController();
	try{
		
		tx = session.getTransaction();
		tx.begin();
		Query query= session.createQuery("from ItemController where itemId="+itemId+" and userId="+userId);
		it = (ItemController) query.uniqueResult();
	tx.commit();
	}catch(Exception e){
		if(tx!=null)
			tx.rollback();
		e.printStackTrace();
	}finally{
		session.close();
	}
	return it;
}

public ItemController getItemControllerByItemId(int itemId){
//	List<InStock> list = new ArrayList<>();
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	Criteria cr;
	ItemController it = new ItemController();
	try{
		
		tx = session.getTransaction();
		tx.begin();
		Query query= session.createQuery("from ItemController where itemId="+itemId);
		it = (ItemController) query.uniqueResult();
	tx.commit();
	}catch(Exception e){
		if(tx!=null)
			tx.rollback();
		e.printStackTrace();
	}finally{
		session.close();
	}
	return it;
}



public boolean itemControllerExists(int itemId, int userId){
boolean exist = true;
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	Criteria cr;
	ItemController it = new ItemController();
	try{
		
		tx = session.getTransaction();
		tx.begin();
		Query query= session.createQuery("from ItemController where itemId="+itemId+" and userId="+userId);
		it = (ItemController) query.uniqueResult();
		if(it==null)
			exist = false;
	tx.commit();
	}catch(Exception e){
		if(tx!=null)
			tx.rollback();
		e.printStackTrace();
	}finally{
		session.close();
	}
	return exist;
}


}
