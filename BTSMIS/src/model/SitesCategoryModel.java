package model;

import hibernateUtility.HibernateUtil;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import service.SitesCategory;


public class SitesCategoryModel {
public boolean registerSitesCategory(SitesCategory p){
		
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

public boolean deleteSitesCategory(SitesCategory p){
	
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
	
public List<SitesCategory> getSitesCategoryList(){
	List<SitesCategory> list = new ArrayList<>();
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	Criteria cr = null;
	try{
		
		tx = session.getTransaction();
		tx.begin();
	list = session.createQuery("from SitesCategory ").list();
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


public SitesCategory getSitesCategory(int id){
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	
	SitesCategory r = new SitesCategory();
	Criteria cr;
	
	try{
		
		tx = session.getTransaction();
		tx.begin();
		cr = session.createCriteria(SitesCategory.class);
		
		 cr.add(Restrictions.eq("id", id));
		
		r =  (SitesCategory) cr.uniqueResult();

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
