 package model;

import hibernateUtility.HibernateUtil;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import service.Bts;
import service.FieldEngineer;
import service.Item;

public class FieldEngineerModel{
	
	
public boolean registerFieldEngineerModelModel(FieldEngineer fm){
		
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		
		try{
			tx = session.getTransaction();
			tx.begin();
			session.saveOrUpdate(fm);
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

public List<FieldEngineer> getAllFieldEngineer(){
	List<FieldEngineer> list = new ArrayList<>();
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	try{
		
		tx = session.getTransaction();
		tx.begin();
	list = session.createQuery("from FieldEngineer").list();

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

public List<FieldEngineer> getFieldEngineerByRegion(int id){
	List<FieldEngineer> list = new ArrayList<>();
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	//Request pro = new Request();
	Criteria cr;
	
	try{
		
		tx = session.getTransaction();
		tx.begin();
		cr = session.createCriteria(FieldEngineer.class);
		
		 cr.add(Restrictions.eq("region", id));
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


public FieldEngineer getFieldEngineer(int id){
//	List<InStock> list = new ArrayList<>();
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	Criteria cr;
	FieldEngineer it = new FieldEngineer();
	try{
		
		tx = session.getTransaction();
		tx.begin();
		Query query= session.createQuery("from FieldEngineer where engId="+id);
		it = (FieldEngineer) query.uniqueResult();
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
}
