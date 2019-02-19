package model;

import hibernateUtility.HibernateUtil;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import service.AccessHandling;
import service.AccessRequest;
import service.Bts;

public class AccessHandlingModel {

	
public boolean registerAccessHandling(AccessHandling p){
		
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

	
public List<AccessHandling> getAccessHandlingList(){
	List<AccessHandling> list = new ArrayList<>();
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	Criteria cr = null;
	try{
		
		tx = session.getTransaction();
		tx.begin();
	list = session.createQuery("from AccessHandling").list();
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


public AccessHandling getAccessHandling(int id){
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	
	AccessHandling r = new AccessHandling(); 
	Criteria cr;
	
	try{
		
		tx = session.getTransaction();
		tx.begin();
		cr = session.createCriteria(AccessHandling.class);
		
		 cr.add(Restrictions.eq("accessHandlingId", id));
		
		r =  (AccessHandling) cr.uniqueResult();

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


public AccessHandling getAccessHandlingByAccessRequest(int arId){
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	
	AccessHandling r = new AccessHandling(); 
	Criteria cr;
	
	try{
		
		tx = session.getTransaction();
		tx.begin();
		cr = session.createCriteria(AccessHandling.class);
		
		 cr.add(Restrictions.eq("ticketId", arId));
		
		r =  (AccessHandling) cr.uniqueResult();

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

public List<AccessHandling> getAccessHandlingByPartner(int id){
	List<AccessHandling> list = new ArrayList<>();
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	//Request pro = new Request();
	Criteria cr;
	
	try{
		
		tx = session.getTransaction();
		tx.begin();
		cr = session.createCriteria(AccessHandling.class);
		
		 cr.add(Restrictions.eq("userId", id));
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


public boolean updateAccessHandlingAttachement(int id,String attachement){
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	AccessHandling r = (AccessHandling)session.get(AccessHandling.class, id);	
	try{
		tx = session.getTransaction();
		tx.begin();

	r.setAttachement(attachement);
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
