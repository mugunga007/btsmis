package model;

import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Map;

import hibernateUtility.HibernateUtil;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;


import service.Item;
import service.Request;

public class RequestModel {

public boolean registerRequest(Request p){
		
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

	
public List<Request> getRequestList(){
	List<Request> list = new ArrayList<>();
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	Criteria cr = null;
	try{
		
		tx = session.getTransaction();
		tx.begin();
		//cr = session.createCriteria(Request.class);
		//cr.add(Restrictions.eq("status", "Request"));
	list = session.createQuery("from Request where stage=0").list();
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



public List<Request> getRequestSummary(){
	List<Request> list = new ArrayList<>(); 
Session session = HibernateUtil.openSession();
Transaction tx = null;
try{
	
	tx = session.getTransaction();
	tx.begin();
	String sql = "select DISTINCT itemId,COUNT(*), sum(quantity) from Request where status = 'Request' and stage=0 group by 1";
	SQLQuery query = session.createSQLQuery(sql);
	query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
	List data = query.list();
	
	
	for(Object object : data){
		Map row = (Map)object;
		
		Request rq = new Request();
		rq.setItemId(Integer.parseInt(row.get("itemId").toString()));
		rq.setDumQuantity(Integer.parseInt(row.get("COUNT(*)").toString()));
		rq.setQuantity(Integer.parseInt(row.get("sum(quantity)").toString()));
		
		list.add(rq);

		
	}


	}catch(Exception e){
	if(tx!=null)
		tx.rollback();
	e.printStackTrace();
}finally{
	session.close();
}

return list;
	
}


public List<Request> getDetailedRequestList(int itemId){
	List<Request> list = new ArrayList<>();
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	//Request pro = new Request();
	Criteria cr;
	
	try{
		
		tx = session.getTransaction();
		tx.begin();
		cr = session.createCriteria(Request.class);
		
		 cr.add(Restrictions.eq("itemId", itemId));
		 cr.add(Restrictions.eq("status", "Request"));
		cr.add(Restrictions.eq("stage", 0));
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


public List<Request> getRequestApprovalsRegion(int region){
	List<Request> list = new ArrayList<>();
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	//Request pro = new Request();
	Criteria cr;
	
	try{
		
		tx = session.getTransaction();
		tx.begin();
		cr = session.createCriteria(Request.class);
		
		cr.add(Restrictions.eq("region", region));
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

public List<Request> getRequestApprovalsRegionSize(int level,  int region){
	List<Request> list = new ArrayList<>();
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	//Request pro = new Request();
	Criteria cr;
	
	try{
		
		tx = session.getTransaction();
		tx.begin();
		cr = session.createCriteria(Request.class);
		cr.add(Restrictions.eq("stage", level));
		cr.add(Restrictions.eq("region", region));
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



public List<Request> getRequestApprovalsOperation( int level){
	List<Request> list = new ArrayList<>();
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	//Request pro = new Request();
	Criteria cr;
	
	try{
		
		tx = session.getTransaction();
		tx.begin();
		cr = session.createCriteria(Request.class);
		
		 cr.add(Restrictions.eq("stage", level));
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

public List<Request> getRequestApprovalsOperationsAll(){
	List<Request> list = new ArrayList<>();
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	//Request pro = new Request();
	Criteria cr;
	
	try{
		
		tx = session.getTransaction();
		tx.begin();
		cr = session.createCriteria(Request.class);
		
		 cr.add(Restrictions.between("stage", 0,1));
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


public int getPendingRequestsNumber(){
	int i = 0;
	List<Request> list = new ArrayList<>();
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	//Request pro = new Request();
	Criteria cr;
	
	try{
		
		tx = session.getTransaction();
		tx.begin();
		cr = session.createCriteria(Request.class);
		
		 cr.add(Restrictions.eq("stage", 0));
		
		 cr.add(Restrictions.eq("status", "Request"));
		//cr.add(Restrictions.eq("price", price));
	//	cr.add(Restrictions.between("price", 0.0, price));
i  = cr.list().size();
	tx.commit();
	}catch(Exception e){
		if(tx!=null)
			tx.rollback();
		e.printStackTrace();
	}finally{
		session.close();
	}
	return i;
}



public Request getRequest(int requestId){
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	
	Request r = new Request();
	Criteria cr;
	
	try{
		
		tx = session.getTransaction();
		tx.begin();
		cr = session.createCriteria(Request.class);
		
		 cr.add(Restrictions.eq("requestId", requestId));
		
		r =  (Request) cr.uniqueResult();

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

public boolean updateRequestDelivery(int requestId,int deliveredQuantity, Date actionDate){
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	 Request r = (Request)session.get(Request.class, requestId);	
	try{
		tx = session.getTransaction();
		tx.begin();

		r.setActionDate(actionDate);
	r.setStatus("Delivered");
	r.setDeliveredQuantity(deliveredQuantity);
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

public boolean approveRequestRegion(int requestId){
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	 Request r = (Request)session.get(Request.class, requestId);	
	try{
		tx = session.getTransaction();
		tx.begin();
		
		r.setStage(1);
	
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

public boolean approveRequestOperations(int requestId){
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	 Request r = (Request)session.get(Request.class, requestId);	
	try{
		tx = session.getTransaction();
		tx.begin();
		
		r.setStage(0);
	
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

public List<Request> getRequestedItems(){
	List<Request> list = new ArrayList<>();
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	//Request pro = new Request();
	Criteria cr;
	
	try{
		
		tx = session.getTransaction();
		tx.begin();
		cr = session.createCriteria(Request.class);
		
		// cr.add(Restrictions.eq("itemId", itemId));
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


public List<Request> getRequestedItemsByUser(int userId){
	List<Request> list = new ArrayList<>();
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	//Request pro = new Request();
	Criteria cr;
	
	try{
		
		tx = session.getTransaction();
		tx.begin();
		cr = session.createCriteria(Request.class);
	
		 cr.add(Restrictions.eq("userId", userId));
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






public List<Request> getDeliveryList(){
	List<Request> list = new ArrayList<>();
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	//Request pro = new Request();
	Criteria cr;
	
	try{
		
		tx = session.getTransaction();
		tx.begin();
		cr = session.createCriteria(Request.class);
		
		// cr.add(Restrictions.eq("itemId", itemId));
		 cr.add(Restrictions.eq("status", "Delivered"));
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


public List<Request> getDeliveryConfirmedList(){
	List<Request> list = new ArrayList<>();
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	//Request pro = new Request();
	Criteria cr;
	
	try{
		
		tx = session.getTransaction();
		tx.begin();
		cr = session.createCriteria(Request.class);
		
		// cr.add(Restrictions.eq("itemId", itemId));
		 cr.add(Restrictions.eq("status", "Delivery Confirmed"));
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




public boolean updateRequestDeny(int requestId, Date actionDate){
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	 Request r = (Request)session.get(Request.class, requestId);	
	try{
		tx = session.getTransaction();
		tx.begin();

		r.setActionDate(actionDate);
	r.setStatus("Denied");
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


public boolean updateRequestConfirmed(int requestId){
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	 Request r = (Request)session.get(Request.class, requestId);	
	try{
		tx = session.getTransaction();
		tx.begin();

	r.setStatus("Delivery Confirmed");
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


public List<Request> getRequestDeliveredByUser(int userId){
	List<Request> list = new ArrayList<>();
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	//Request pro = new Request();
	Criteria cr;
	
	try{
		
		tx = session.getTransaction();
		tx.begin();
		cr = session.createCriteria(Request.class);
		 cr.add(Restrictions.eq("userId", userId));
		 cr.add(Restrictions.eq("status", "Delivered"));
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

public List<Request> getDeliveryConfirmedByUser(int userId){
	List<Request> list = new ArrayList<>();
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	//Request pro = new Request();
	Criteria cr;
	
	try{
		
		tx = session.getTransaction();
		tx.begin();
		cr = session.createCriteria(Request.class);
		 cr.add(Restrictions.eq("userId", userId));
		 cr.add(Restrictions.eq("status", "Delivery Confirmed"));
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

public int daysBetween(Date d1, Date d2){
	
	Calendar ca1 = new GregorianCalendar();
	Calendar ca2 = new GregorianCalendar();
	Calendar caf = new GregorianCalendar();
	int days = 0;
	ca1.setTime(d1);
	ca2.setTime(d2);
	
	Date dumd = null;
	String cafs = ca1.YEAR+"-12-31";
	try{
		dumd = new SimpleDateFormat("yyyy-MM-dd").parse(cafs);
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
	caf.setTime(dumd);
	
int daysca1 = ca1.get(Calendar.DAY_OF_YEAR);
int daysca2 = ca2.get(Calendar.DAY_OF_YEAR);
int dayscaf = caf.get(Calendar.DAY_OF_YEAR);

if(ca2.after(ca1))
if(ca1.get(Calendar.YEAR) == ca2.get(Calendar.YEAR))
	days = daysca2 - daysca1;
else
	days = (dayscaf - daysca1) + daysca2 + 1;


return days;

}


}
