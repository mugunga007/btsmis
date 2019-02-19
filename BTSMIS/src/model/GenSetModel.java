 package model;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import hibernateUtility.HibernateUtil;


import service.AddFuel;
import service.Bts;
import service.GenSet;
import service.Request;

public class GenSetModel{
	
	
public boolean register(GenSet b){
		
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


public GenSet getGenSetByBts(String btsId){
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	
	GenSet r = new GenSet();
	Criteria cr;
	
	try{
		
		tx = session.getTransaction();
		tx.begin();
		cr = session.createCriteria(GenSet.class);
		
		 cr.add(Restrictions.eq("btsId", btsId));
		
		r =  (GenSet) cr.uniqueResult();

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

public GenSet getGenSet(String id){
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	
	GenSet r = new GenSet();
	Criteria cr;
	
	try{
		
		tx = session.getTransaction();
		tx.begin();
		cr = session.createCriteria(GenSet.class);
		
		 cr.add(Restrictions.eq("genSetId", id));
		
		r =  (GenSet) cr.uniqueResult();

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





public GenSet getGenSetById(String genSetId){
//	List<InStock> list = new ArrayList<>();
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	Criteria cr;
	GenSet it = new GenSet();
	try{
		
		tx = session.getTransaction();
		tx.begin();
		Query query= session.createQuery("from GenSet where genSetId="+genSetId);
		it = (GenSet) query.uniqueResult();
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


public AddFuel getQuantity(String genSetId){
//	List<InStock> list = new ArrayList<>();
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	Criteria cr;
	AddFuel it = new AddFuel();
	try{
		
		tx = session.getTransaction();
		tx.begin();
		Query query= session.createQuery("from AddFuel where genSetId="+genSetId);
		it = (AddFuel) query.uniqueResult();
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


public boolean updateFuelQuantity(String genSetId,int quantity,Date date,String status){
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	GenSet r = (GenSet)session.get(GenSet.class, genSetId);	
	try{
		tx = session.getTransaction();
		tx.begin();
r.setQuantity(quantity);
r.setDate(date);
	r.setStatus(status);
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


public boolean updateGenDate(String genSetId,Date date){
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	GenSet r = (GenSet)session.get(GenSet.class, genSetId);	
	try{
		tx = session.getTransaction();
		tx.begin();
r.setLastUpdate(date);
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
