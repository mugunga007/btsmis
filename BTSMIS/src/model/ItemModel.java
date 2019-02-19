package model;

import java.util.ArrayList;
import java.util.List;

import hibernateUtility.HibernateUtil;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import service.InStock;
import service.Item;

public class ItemModel {
	
	
public boolean registerItem(Item p){
		
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

public Item getItem(int itemId){
//	List<InStock> list = new ArrayList<>();
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	Criteria cr;
	Item it = new Item();
	try{
		
		tx = session.getTransaction();
		tx.begin();
		Query query= session.createQuery("from Item where  itemId="+itemId);
		it = (Item) query.uniqueResult();
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

public Item getFuelItem(){
//	List<InStock> list = new ArrayList<>();
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	Criteria cr;
	Item it = new Item();
	try{
		String fuel = "Fuel";
		tx = session.getTransaction();
		tx.begin();
		Query query= session.createQuery("from Item where itemName='"+fuel+"'");
		it = (Item) query.uniqueResult();
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




public boolean updateItemQuantity(int itemId,int quantity){
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	 Item it = (Item)session.get(Item.class, itemId);	
	try{
		tx = session.getTransaction();
		tx.begin();
		
		it.setQuantity(quantity);
	//pro.setStatus("released");
		session.update(it);
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


public int getItemQuantity(int itemId){
	int quantity = 0;
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	 Item it = (Item)session.get(Item.class, itemId);	
	try{
		tx = session.getTransaction();
		tx.begin();
		
		quantity = it.getQuantity();
	//pro.setStatus("released");
	//	session.update(it);
		tx.commit();
	}
		catch(Exception e){
			if(tx!=null)
				tx.rollback();
			e.printStackTrace();
		}finally {
			session.close();
	}
	return quantity;
	
}

public List<Item> getAvailableItems(){
	List<Item> list = new ArrayList<>();
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	//Request pro = new Request();
	Criteria cr;
	
	try{
		
		tx = session.getTransaction();
		tx.begin();
		cr = session.createCriteria(Item.class);
		
		 cr.add(Restrictions.gt("quantity", 0));
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


public List<Item> getStockReport(){
	List<Item> list = new ArrayList<>();
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	//Request pro = new Request();
	Criteria cr;
	
	try{
		
		tx = session.getTransaction();
		tx.begin();
		cr = session.createCriteria(Item.class);
		
		 cr.add(Restrictions.gt("quantity", 0));
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
