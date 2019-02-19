package model;

import hibernateUtility.HibernateUtil;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import service.AccessRequest;
import service.Bts;


public class AccessRequestModel {

public boolean registerAccessRequest(AccessRequest p){
		
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

	
public List<AccessRequest> getAccessRequestList(){
	List<AccessRequest> list = new ArrayList<>();
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	Criteria cr = null;
	try{
		
		tx = session.getTransaction();
		tx.begin();
	list = session.createQuery("from AccessRequest").list();
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


public AccessRequest getAccessRequest(int id){
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	
	AccessRequest r = new AccessRequest(); 
	Criteria cr;
	
	try{
		
		tx = session.getTransaction();
		tx.begin();
		cr = session.createCriteria(AccessRequest.class);
		
		 cr.add(Restrictions.eq("requestId", id));
		
		r =  (AccessRequest) cr.uniqueResult();

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

public List<AccessRequest> getAccessRequestByPartner(int id){
	List<AccessRequest> list = new ArrayList<>();
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	//Request pro = new Request();
	Criteria cr;
	
	try{
		
		tx = session.getTransaction();
		tx.begin();
		cr = session.createCriteria(AccessRequest.class);
		
		 cr.add(Restrictions.eq("partnerId", id));
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


public List<AccessRequest> getPendingRequests(){
	List<AccessRequest> list = new ArrayList<>();
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	//Request pro = new Request();
	Criteria cr;
	
	try{
		
		tx = session.getTransaction();
		tx.begin();
		cr = session.createCriteria(AccessRequest.class);
		
		 cr.add(Restrictions.eq("status", "Waiting"));
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


public boolean updateReportedAccessRequest(int id){
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	AccessRequest r = (AccessRequest)session.get(AccessRequest.class, id);	
	try{
		tx = session.getTransaction();
		tx.begin();

	r.setStatus("Reported");
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

public boolean confirmAccessRequest(int id){
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	AccessRequest r = (AccessRequest)session.get(AccessRequest.class, id);	
	try{
		tx = session.getTransaction();
		tx.begin();

	
	r.setStatus("Confirmed");
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
